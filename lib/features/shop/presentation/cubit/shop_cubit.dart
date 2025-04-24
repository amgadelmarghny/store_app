import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/features/auth/domain/usecases/change_user_password_usecase.dart';
import 'package:soagmb/features/auth/domain/usecases/update_profile_usecase.dart';
import 'package:soagmb/features/shop/data/models/user/change_user_password_parameter.dart';
import 'package:soagmb/features/shop/data/models/user/update_profile_parameter.dart';
import 'package:soagmb/features/shop/domain/entities/user/change_password.dart';
import 'package:soagmb/features/shop/domain/entities/add_complaint_impl.dart';
import 'package:soagmb/features/shop/domain/entities/cart/get_cart.dart';
import 'package:soagmb/features/shop/domain/entities/cart/update_cart.dart';
import 'package:soagmb/features/shop/domain/entities/categories.dart';
import 'package:soagmb/features/shop/domain/entities/change_favorite.dart';
import 'package:soagmb/features/shop/domain/entities/complaint.dart';
import 'package:soagmb/features/shop/domain/entities/favorites.dart';
import 'package:soagmb/features/shop/domain/entities/home.dart';
import 'package:soagmb/features/shop/domain/entities/logout.dart';
import 'package:soagmb/features/shop/domain/entities/product.dart';
import 'package:soagmb/features/shop/domain/entities/update_cart_items_impl.dart';
import 'package:soagmb/features/shop/domain/usecases/add_and_remove_cart_usecase.dart';
import 'package:soagmb/features/shop/domain/usecases/add_and_remove_favorites_usecase.dart';
import 'package:soagmb/features/shop/domain/usecases/add_complaint_usecase.dart';
import 'package:soagmb/features/shop/domain/usecases/get_cart_items_usecase.dart';
import 'package:soagmb/features/shop/domain/usecases/get_categories_usecase.dart';
import 'package:soagmb/features/shop/domain/usecases/get_favorite_products_usecase.dart';
import 'package:soagmb/features/shop/domain/usecases/get_home_data_usecase.dart';
import 'package:soagmb/features/shop/domain/usecases/get_profile_info_usecase.dart';
import 'package:soagmb/features/shop/domain/usecases/update_cart_item_usecase.dart';
import 'package:soagmb/features/shop/domain/usecases/user_logout_usecase.dart';
import 'package:soagmb/features/shop/presentation/widgets/categories_body.dart';
import 'package:soagmb/features/shop/presentation/widgets/favorite_body.dart';
import 'package:soagmb/features/shop/presentation/widgets/home_body.dart';
import 'package:soagmb/features/shop/domain/entities/user/profile.dart';
import 'package:soagmb/generated/l10n.dart';
part 'shop_state.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit(
      this.getHomeDataUsecase,
      this.getCartItemsUsecase,
      this.getProfileInfoUsecase,
      this.getFavoriteProductsUsecase,
      this.getCategoriesUsecase,
      this.updateCartItemUsecase,
      this.addAndRemoveCartUsecase,
      this.addAndRemoveFavoritesUsecase,
      this.logoutUseCase,
      this.addComplaintUsecase,
      this.updateProfileUsecase,
      this.changeUserPasswordUsecase)
      : super(ShopInitial());

  static ShopCubit get(context) => BlocProvider.of(context);

  final GetHomeDataUsecase getHomeDataUsecase;
  final GetCartItemsUsecase getCartItemsUsecase;
  final GetProfileInfoUsecase getProfileInfoUsecase;
  final GetFavoriteProductsUsecase getFavoriteProductsUsecase;
  final GetCategoriesUsecase getCategoriesUsecase;
  final UpdateCartItemUsecase updateCartItemUsecase;
  final AddAndRemoveCartUsecase addAndRemoveCartUsecase;
  final AddAndRemoveFavoritesUsecase addAndRemoveFavoritesUsecase;
  final UserLogoutUsecase logoutUseCase;
  final AddComplaintUsecase addComplaintUsecase;
  final UpdateProfileUsecase updateProfileUsecase;
  final ChangeUserPasswordUsecase changeUserPasswordUsecase;

  ///////////////////////////////
  List<Widget>? drawerItems;

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavBarItems(context) {
    return [
      BottomNavigationBarItem(
          icon: currentIndex == 0
              ? const Icon(Icons.store_mall_directory)
              : const Icon(Icons.store_mall_directory_outlined),
          label: S.of(context).home),
      BottomNavigationBarItem(
          icon: Icon(Icons.apps_outlined), label: S.of(context).categories),
      BottomNavigationBarItem(
          icon: currentIndex == 2
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_outline),
          label: S.of(context).favorites),
    ];
  }

  void navigatBottomBar(int index) {
    currentIndex = index;
    emit(NatigateBottomBar());
  }

  List<Widget> currentBody = const [
    HomeBody(),
    CategoryBody(),
    FavoriteBody(),
  ];
////////////////////////////////////? GET  HOME  DATA //////////////////////////
  Home? homeModel;
  Map<int, bool> favoriteProductsMap = {};
  Map<int, bool> inCartProductsMap = {};

  Future<void> getHomeData() async {
    emit(GetHomeDataLoadingState());
    final result = await getHomeDataUsecase(NoParameters());
    return result.fold(
      (l) => emit(GetHomeDataFailureState(errMessage: l.errMessage)),
      (r) {
        homeModel = r;
        for (var element in homeModel!.data!.productsList) {
          favoriteProductsMap.addAll({element.id: element.inFavorites!});
          inCartProductsMap.addAll({element.id: element.inCart!});
        }
        emit(GetHomeDataSuccessState());
      },
    );
  }

////////////////////////////////////? GET  CATEGORY ////////////////////////////
  Categories? categoryHomeModel;
  void getCategories() async {
    emit(GetCategoriesLoadingState());
    final result = await getCategoriesUsecase(NoParameters());
    return result.fold(
      (l) => emit(GetCategoriesFailureState(errMessage: l.errMessage)),
      (r) {
        categoryHomeModel = r;
        emit(GetCategoriesSuccess());
      },
    );
  }

  //////////////////////////////? ADD  AND  REMOVE  FROM  FAVORITES ////////////

  void addAndRemoveFavorite({required int id}) async {
    favoriteProductsMap[id] = !favoriteProductsMap[id]!;
    emit(FavoriteLoadingState());
    final result = await addAndRemoveFavoritesUsecase(id);
    return result.fold(
      (l) => emit(FavoriteFailureState(errMessage: l.errMessage)),
      (r) async {
        if (r.status) {
          await getFavoriteProducts();
        } else {
          favoriteProductsMap[id] = !favoriteProductsMap[id]!;
        }
        emit(FavoriteSussiccState(changedFavoriteModel: r));
      },
    );
  }

//////////////////////////////////////? GET  FAVORITES /////////////////////////
  GetFavorites? favoritesModel;

  Future<void> getFavoriteProducts() async {
    emit(GetFavoritesLoadingState());
    final result = await getFavoriteProductsUsecase(NoParameters());
    return result.fold(
      (l) => emit(GetFavoritesFailureState(errMessage: l.errMessage)),
      (r) {
        favoritesModel = r;
        emit(GetFavoritesSuccess());
      },
    );
  }

//////////////////////////////////? GET PROFILE INFO ///////////////////////////
  Profile? profileModel;

  Future<void> getProfileInfo() async {
    emit(ProfileLoadingState());
    final result = await getProfileInfoUsecase(NoParameters());
    return result.fold(
      (l) => emit(ProfileFailureState(errMessage: l.errMessage)),
      (r) {
        profileModel = r;
        emit(ProfileSuccessState());
      },
    );
  }

  ////////////////////////////? UPDATE  USER  INFORMATION ////////////////////////
  Future<void> updateUserInfo(
      {required UpdateProfileParameter parameter}) async {
    emit(UpdateProfileLoadingState());
    final result = await updateProfileUsecase(parameter);
    result.fold(
      (l) => emit(UpdateProfileFailureState(errMessage: l.errMessage)),
      (r) async {
        emit(UpdateProfileSuccessState(profileModel: r));
        await getProfileInfo();
        // this to make photo in edit
        imageFile = null;
      },
    );
  }

  File? imageFile;
  Future<File?> pickImage({
    ImageSource source = ImageSource.gallery,
  }) async {
    File? pickedImage;
    final ImagePicker picker = ImagePicker();
    final xFileImage = await picker.pickImage(source: source);
    if (xFileImage != null) {
      pickedImage = File(xFileImage.path);
      imageFile = pickedImage;
      emit(PickImageSuccessState());
      return pickedImage;
    } else {
      emit(PickImageFailureState(errMessage: 'No image selected'));
      return null;
    }
  }

  String? image;
  Future<String> encodeImageToBase64(File imageFile) async {
    final bytes = await imageFile.readAsBytes();
    image = base64Encode(bytes);
    return image!;
  }

  ////////////////////////? Change Password /////////////////////////////
  void changeAccPassword(
      {required ChangeUserPasswordParameter parameter}) async {
    emit(ChangePasswordLoadingState());
    final result = await changeUserPasswordUsecase(parameter);
    result.fold(
      (l) => emit(ChangePasswordFailureState(errMessage: l.errMessage)),
      (r) => emit(ChangePasswordSuccessState(changePasswordModel: r)),
    );
  }

//////////////////////////////////////? LOGOUT /////////////////////////////////
  Future<void> userLogout() async {
    final result = await logoutUseCase(NoParameters());
    return result.fold(
      (l) => emit(LogoutFailureState(errMessage: l.errMessage)),
      (r) => emit(LogoutSuccussState(logoutModel: r)),
    );
  }

////////////////////////? Add and remove  from Cart ////////////////////////////

  Future<void> addAndRemoveCart({required int productId}) async {
    inCartProductsMap[productId] = !inCartProductsMap[productId]!;
    emit(AddToCartLoadingState());
    final result = await addAndRemoveCartUsecase(productId);
    return result.fold(
      (l) => emit(AddToCartFailureState(errMessage: l.errMessage)),
      (r) {
        getHomeData();
        getCartItems();
        emit(AddToCartSussiccState(changedCartModel: r));
      },
    );
  }

  ////////////////////////////////? GET CART  PRODUCTS /////////////////////////
  GetCart? cartModel;
  Map<int, int> quantityNumberMap = {};
  Product? productCheck;
  Future<void> getCartItems() async {
    emit(GetCartLoadingState());
    final result = await getCartItemsUsecase(NoParameters());
    return result.fold(
      (l) => emit(GetCartFailureState(errMessage: l.errMessage)),
      (r) {
        cartModel = r;
        for (var element in cartModel!.data!.cartItemsList) {
          quantityNumberMap.addAll({element.product.id: element.quantity});
        }
        emit(GetCartSuccessState());
      },
    );
  }

  //////////////////////? UPDATE NUM OF ITEMS  IN THE CART /////////////////////
  UpdateCart? updateCartModel;
  void updateNumberOfItemInTheCart({
    required UpdateCartItemsImpl impl,
  }) async {
    emit(UpdateCartLoadingState());
    final result = await updateCartItemUsecase(impl);
    return result.fold(
      (l) => emit(UpdateCartFailureState(errMessage: l.errMessage)),
      (r) {
        updateCartModel = r;
        getCartItems();
        emit(UpdateCartSuccessState());
      },
    );
  }

  ////////////////! Add Complaint /////////////////
  Complaint? complaintModel;
  void addComplaint({required AddComplaintImpl parameter}) async {
    emit(AddComplainLoading());
    final result = await addComplaintUsecase(parameter);
    return result.fold(
      (l) => emit(AddComplainFaluir(error: l.errMessage)),
      (r) {
        complaintModel = r;
        emit(AddComplainSuccess());
      },
    );
  }
}
