import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_2/mdules/categories/categories_body.dart';
import 'package:store_2/mdules/favorite/favorite_body.dart';
import 'package:store_2/mdules/home/home_body.dart';
import 'package:store_2/models/catergory_model/catergory_model.dart';
import 'package:store_2/models/get_favorites_model/get_favorites_model.dart';
import 'package:store_2/models/logout_model/logout_model.dart';
import 'package:store_2/models/profile_model/profile_model.dart';
import 'package:store_2/models/shope_models/home_model.dart';
import 'package:store_2/shared/components/constants.dart';
import 'package:store_2/shared/components/navigation.dart';
import 'package:store_2/shared/network/lockal/key_const.dart';
import 'package:store_2/shared/network/lockal/shared_helper.dart';
import 'package:store_2/shared/network/remot/dio_helper.dart';
import 'package:store_2/shared/network/remot/end_points_url.dart';
import '../../../models/fav_model/favorite_model.dart';
part 'shop_state.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitial());

  List<Widget>? draverItems;

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavBarItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.apps_outlined), label: 'Categories'),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_outline), label: 'Favotite'),
  ];

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
  ChangedFavoriteModel? changedFavoriteModel;

  void addAndRemoveFavorite({required int id}) {
    favoriteProductsMap[id] = !favoriteProductsMap[id]!;
    emit(FavoriteLoadingState());
    DioHelper.postData(
      url: favCONST,
      token: authToken,
      data: {"product_id": id},
    ).then((value) {
      changedFavoriteModel = ChangedFavoriteModel.fromJson(value.data);
      debugPrint(
          'Add & Remove Favorite stateeee :::::: ${changedFavoriteModel!.status}');
      if (changedFavoriteModel!.status) {
        getFavoriteProducts();
        debugPrint('^^^^^^ get fav success ^^^^^^');
      } else {
        favoriteProductsMap[id] = !favoriteProductsMap[id]!;
      }
      emit(FavoriteSussiccState(changedFavoriteModel: changedFavoriteModel!));
    }).catchError((err) {
      emit(FavoriteFailureState(errMessage: err.toString()));
    });
  }

////////////////////////////////////// GET  FAVORITES //////////////////////////
  GetFavoritesModel? favoritesModel;

  getFavoriteProducts() {
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
  ProfileModel? profileModel;
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
}
