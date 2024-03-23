import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_2/models/get_cart_model.dart';
import 'package:store_2/modules/categories/categories_body.dart';
import 'package:store_2/modules/favorite/favorite_body.dart';
import 'package:store_2/modules/home/home_body.dart';
import 'package:store_2/models/catergory_model.dart';
import 'package:store_2/models/get_favorites_model.dart';
import 'package:store_2/models/logout_model.dart';
import 'package:store_2/models/profile_model.dart';
import 'package:store_2/models/shope_models/home_model.dart';
import 'package:store_2/shared/components/constants.dart';
import 'package:store_2/shared/components/navigation.dart';
import 'package:store_2/shared/network/local/key_const.dart';
import 'package:store_2/shared/network/local/shared_helper.dart';
import 'package:store_2/shared/network/remot/dio_helper.dart';
import 'package:store_2/shared/network/remot/end_points_url.dart';
import '../../../models/favorite_model.dart';
part 'shop_state.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitial());

  List<Widget>? draverItems;

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavBarItems({required Color? color}) {
    return [
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'lib/assets/images/shop.svg',
            color: color,
          ),
          label: 'Home'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.apps_outlined), label: 'Categories'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline), label: 'Favorite'),
    ];
  }

  void selectIconChange(int index) {
    currentIndex = index;
    emit(NavBarChangeState());
  }

  List<Widget> currentBody = const [
    HomeBody(),
    CategoryBody(),
    FavoriteBody(),
  ];
/////////////////////////////////// GET  HOME  DATA ////////////////////////////
  HomeModel? homeModel;
  Map<int, bool> favoriteProductsMap = {};
  Map<int, bool> inCartProductsMap = {};

  void getHomeData() {
    emit(GetHomeDataLoadingState());
    DioHelper.getData(
      url: 'home',
      token: authToken,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      for (var element in homeModel!.data!.productsList) {
        favoriteProductsMap.addAll({element.id: element.inFavorites!});
        inCartProductsMap.addAll({element.id: element.inCart!});
      }
      emit(GetHomeDataSuccessState());
    }).catchError((err) {
      emit(GetHomeDataFailureState(errMessage: err));
    });
  }

///////////////////////////////////// GET  CATEGORY ////////////////////////////
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

  /////////////////////////////// ADD  AND  REMOVE  FROM  FAVORITES ////////////
  late ChangedFavoriteModel changedFavoriteModel;

  void addAndRemoveFavorite({required int id}) {
    favoriteProductsMap[id] = !favoriteProductsMap[id]!;
    emit(FavoriteLoadingState());
    DioHelper.postData(
      url: favCONST,
      token: authToken,
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

////////////////////////////////////// GET  FAVORITES //////////////////////////
  late GetFavoritesModel favoritesModel;

  void getFavoriteProducts() {
    emit(GetFavoritesLoadingState());
    DioHelper.getData(
      url: favCONST,
      token: authToken,
    ).then((value) {
      favoritesModel = GetFavoritesModel.fromJson(value.data);
      emit(GetFavoritesSuccess());
    }).catchError((e) {
      emit(GetFavoritesFailureState(errMessage: e.toString()));
    });
  }

/////////////////////////////////// GET PROFILE INFO ///////////////////////////
  late ProfileModel profileModel;

  void getProfileInfo() {
    emit(ProfileLoadingState());
    DioHelper.getData(
      url: profile,
      token: authToken,
    ).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      emit(ProfileSuccessState());
    }).catchError((err) {
      emit(ProfileFailureState(errMessage: err.toString()));
    });
  }

////////////////////////////////////// LOGOUT //////////////////////////////////
  void userLogout(BuildContext context, {required String routName}) async {
    emit(LogoutLoadingState());
    return await DioHelper.postData(url: logout, token: authToken)
        .then((value) {
      Navigator.pop(context);
      Navigator.pop(context);
      navigatorPushAndRemove(context, routName);
      CashHelper.deleteCash(key: tOKENCONST);
      emit(LogoutSuccussState(logoutModel: LogoutModel.fromJson(value.data)));
    }).catchError((err) {
      emit(GetHomeDataFailureState(errMessage: err.toString()));
    });
  }
  
///////////////// Add and remove  from Cart /////////////////////////////
  
  ChangedFavoriteModel? changedCartModel;
  bool isAdd = false;

  Future addAndRemoveCart({required int productId}) async {
    emit(CartLoadingState());
    await DioHelper.postData(
      url: carts,
      token: authToken,
      data: {"product_id": productId},
    ).then((value) {
      changedCartModel = ChangedFavoriteModel.fromJson(value.data);
      emit(CartSussiccState(changedCartModel: changedCartModel!));
    }).catchError((errMessage) {
      emit(CartFailureState(errMessage: errMessage));
    });
  }

  //////////////////////////////// CET CART  PRODUCTS ////////////////////////////
   GetCartModel? cartModel;

  void getCartItems() {
    emit(GetCartLoadingState());
    DioHelper.getData(
      url: carts,
      token: authToken,
    ).then((value) {
      cartModel = GetCartModel.fromJson(value.data);
      emit(GetCartSuccessState());
    }).catchError((err) {
      emit(GetCartFailureState(errMessage: err.toString()));
    });
  }
}
