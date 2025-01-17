import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/models/cart_models/get_cart_model.dart';
import 'package:soagmb/models/cart_models/update_cart.dart';
import 'package:soagmb/models/shop_models/product_model.dart';
import 'package:soagmb/features/shop/presentation/widgets/categories_body.dart';
import 'package:soagmb/features/shop/presentation/widgets/favorite_body.dart';
import 'package:soagmb/features/shop/presentation/widgets/home_body.dart';
import 'package:soagmb/models/category_model.dart';
import 'package:soagmb/models/get_favorites_model.dart';
import 'package:soagmb/models/logout_model.dart';
import 'package:soagmb/features/user/data/models/profile_model.dart';
import 'package:soagmb/models/shop_models/home_model.dart';
import 'package:soagmb/features/shop/presentation/widgets/navigation.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/core/network/remote/dio_helper_for_shop.dart';
import 'package:soagmb/core/network/remote/end_points_url.dart';
import '../../../models/favorite_model.dart';
import '../../../features/shop/presentation/widgets/favorite_notification_circle.dart';
part 'shop_state.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitial());

  List<Widget>? drawerItems;

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavBarItems({required Color color}) {
    return [
      BottomNavigationBarItem(
          icon: currentIndex == 0
              ? const Icon(
                  Icons.store_mall_directory,
                  size: 27,
                )
              : const Icon(Icons.store_mall_directory_outlined),
          label: 'Home'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.apps_outlined), label: 'Categories'),
      BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              currentIndex == 2
                  ? const Icon(
                      Icons.favorite,
                      size: 26,
                    )
                  : const Icon(Icons.favorite_outline),
              // if user in fav. view ,fav. notifi. will not show
              if (currentIndex != 2)
                // when the app opened and getFavorite request finish
                if (favoritesModel != null)
                  // and user add product to fav then show count of favorites
                  // then the notification will appear
                  if (favoritesModel!.favoritesDataModel != null &&
                      favoritesModel!.favoritesDataModel!.total! > 0)

                    // this to make notification disappear when user press on Favorite screen
                    // then favoriteNotifi. will deleted
                    // so I check if it was deleted , the  notification will not appear again
                    if (CashHelper.getData(key: favNotofication) != null)
                      FavoriteNotificationCircle(),
            ],
          ),
          label: 'Favorite'),
    ];
  }

////////////////
  void selectIconChange(int index) {
    currentIndex = index;
    // to delete favNotification  from Cash Helper
    // after pressing on fav button nav bar
    if (currentIndex == 2) {
      CashHelper.deleteCash(key: favNotofication);
    }
    emit(NavBarChangeState());
  }

  List<Widget> currentBody = const [
    HomeBody(),
    CategoryBody(),
    FavoriteBody(),
  ];
////////////////////////////////////? GET  HOME  DATA ////////////////////////////
  HomeModel? homeModel;
  Map<int, bool> favoriteProductsMap = {};
  Map<int, bool> inCartProductsMap = {};

  void getHomeData() async {
    emit(GetHomeDataLoadingState());
    await DioHelper.getData(
      url: 'home',
      token: CashHelper.getData(key: tOKENCONST),
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      for (var element in homeModel!.data!.productsList) {
        favoriteProductsMap.addAll({element.id: element.inFavorites!});
        inCartProductsMap.addAll({element.id: element.inCart!});
      }
      emit(GetHomeDataSuccessState());
    }).catchError((err) {
      emit(GetHomeDataFailureState(errMessage: err.toString()));
    });
  }

////////////////////////////////////? GET  CATEGORY ////////////////////////////
  CategoriesModel? categoryHomeModel;
  void getCategories() {
    emit(GetCategoriesLoadingState());
    DioHelper.getData(
      url: categories,
    ).then((value) {
      categoryHomeModel = CategoriesModel.fromJson(value.data);
      emit(GetCategoriesSuccess());
    }).catchError((err) {
      emit(GetCategoriesFailureState(errMessage: err));
    });
  }

  //////////////////////////////? ADD  AND  REMOVE  FROM  FAVORITES ////////////
  late ChangedFavoriteModel changedFavoriteModel;

  void addAndRemoveFavorite({required int id}) {
    // when we  want to add a product to favorites ,
    // the notification will be red notification on fav button vav bar
    // so I cash bool value to allow the notifi. to appear
    CashHelper.setData(key: favNotofication, value: true);
    favoriteProductsMap[id] = !favoriteProductsMap[id]!;
    emit(FavoriteLoadingState());
    DioHelper.postData(
      url: favCONST,
      token: CashHelper.getData(key: tOKENCONST),
      data: {"product_id": id},
    ).then((value) {
      changedFavoriteModel = ChangedFavoriteModel.fromJson(value.data);
      if (changedFavoriteModel.status) {
        getFavoriteProducts();
        debugPrint('^^^^^^ get fav success ^^^^^^');
      } else {
        favoriteProductsMap[id] = !favoriteProductsMap[id]!;
      }
      emit(FavoriteSussiccState(changedFavoriteModel: changedFavoriteModel));
    }).catchError((err) {
      emit(FavoriteFailureState(errMessage: err.toString()));
    });
  }

//////////////////////////////////////? GET  FAVORITES //////////////////////////
  GetFavoritesModel? favoritesModel;

  void getFavoriteProducts() async {
    emit(GetFavoritesLoadingState());
    await DioHelper.getData(
      url: favCONST,
      token: CashHelper.getData(key: tOKENCONST),
    ).then((value) {
      favoritesModel = GetFavoritesModel.fromJson(value.data);
      emit(GetFavoritesSuccess());
    }).catchError((e) {
      emit(GetFavoritesFailureState(errMessage: e.toString()));
    });
  }

//////////////////////////////////? GET PROFILE INFO ///////////////////////////
  ProfileModel? profileModel;

  Future getProfileInfo() async {
    emit(ProfileLoadingState());
    await DioHelper.getData(
      url: profile,
      token: CashHelper.getData(key: tOKENCONST),
    ).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      emit(ProfileSuccessState());
    }).catchError((err) {
      emit(ProfileFailureState(errMessage: err.toString()));
    });
  }

//////////////////////////////////////? LOGOUT //////////////////////////////////
  void userLogout(BuildContext context, {required String routName}) async {
    emit(LogoutLoadingState());
    await DioHelper.postData(
            url: logout, token: CashHelper.getData(key: tOKENCONST))
        .then((value) {
      if (context.mounted) navigatorPushAndRemove(context, routName);
      CashHelper.deleteCash(key: tOKENCONST);
      CashHelper.deleteCash(key: customerID);
      emit(LogoutSuccussState(logoutModel: LogoutModel.fromJson(value.data)));
    }).catchError((err) {
      emit(GetHomeDataFailureState(errMessage: err.toString()));
    });
  }

///////////////// Add and remove  from Cart /////////////////////////////

  ChangedFavoriteModel? changedCartModel;

  void addAndRemoveCart({required int productId}) async {
    inCartProductsMap[productId] = !inCartProductsMap[productId]!;
    emit(CartLoadingState());
    await DioHelper.postData(
      url: carts,
      token: CashHelper.getData(key: tOKENCONST),
      data: {"product_id": productId},
    ).then((value) {
      changedCartModel = ChangedFavoriteModel.fromJson(value.data);
      getCartItems();
      emit(CartSussiccState(changedCartModel: changedCartModel!));
    }).catchError((errMessage) {
      emit(CartFailureState(errMessage: errMessage));
    });
  }

  //////////////////////////////// CET CART  PRODUCTS ////////////////////////////
  GetCartModel? cartModel;
  Map<int, int> quantityNumberMap = {};
  ProductModel? productCheck;
  void getCartItems() async {
    emit(GetCartLoadingState());
    await DioHelper.getData(
      url: carts,
      token: CashHelper.getData(key: tOKENCONST),
    ).then((value) {
      cartModel = GetCartModel.fromJson(value.data);
      for (var element in cartModel!.data!.cartItemsList) {
        quantityNumberMap.addAll({element.productModel.id: element.quantity});
      }
      emit(GetCartSuccessState());
    }).catchError((err) {
      emit(GetCartFailureState(errMessage: err.toString()));
    });
  }

  ///////////////////// UPDATE NUM OF ITEMS  IN THE CART ///////////////////////
  UpdateCartModel? updateCartModel;
  void updateNumberOfItemInTheCart({
    required int cartID,
    required int numberOfItemsInTheCart,
  }) async {
    emit(UpdateCartLoadingState());
    await DioHelper.putData(
        url: '$carts/$cartID',
        token: CashHelper.getData(key: tOKENCONST),
        data: {
          'quantity': numberOfItemsInTheCart,
        }).then((value) {
      updateCartModel = UpdateCartModel.fromJson(value.data);
      getCartItems();
      emit(UpdateCartSuccessState());
    }).catchError((err) {
      emit(UpdateCartFailureState(errMessage: err.toString()));
    });
  }
}
