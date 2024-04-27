import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_2/models/cart_models/get_cart_model.dart';
import 'package:store_2/models/cart_models/update_cart.dart';
import 'package:store_2/models/change_password.dart';
import 'package:store_2/models/shope_models/product_model.dart';
import 'package:store_2/modules/categories/categories_body.dart';
import 'package:store_2/modules/favorite/favorite_body.dart';
import 'package:store_2/modules/home/home_body.dart';
import 'package:store_2/models/catergory_model.dart';
import 'package:store_2/models/get_favorites_model.dart';
import 'package:store_2/models/logout_model.dart';
import 'package:store_2/models/profile_model.dart';
import 'package:store_2/models/shope_models/home_model.dart';
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
              // if user on fav view ,fav notifi. will not show
              if (currentIndex != 2)
                // when the app oppened and getFavorite requist finish
                if (favoritesModel != null)
                  // and user add product to fav then show count of favorites
                  // then the notification will appear
                  if (favoritesModel!.favoritesDataModel != null)
                    if (favoritesModel!.favoritesDataModel!.total! > 0)
                      // this to make notification disappear when user press on Favorite screen
                      // then favoriteNotifi. will deleted
                      // so I check if it was deleted , the  notification will not appear again
                      if (CashHelper.getData(key: favNotofication) != null)
                        Positioned(
                          top: -6,
                          right: -6,
                          child: Container(
                            width: 15.5,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: FittedBox(
                                child: Text(
                                  favoritesModel!.favoritesDataModel!.total!
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
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

  void getHomeData() {
    emit(GetHomeDataLoadingState());
    DioHelper.getData(
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
      emit(GetHomeDataFailureState(errMessage: err));
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
    // the notification will be red notofication on fav button vav bar
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

  void getFavoriteProducts() {
    emit(GetFavoritesLoadingState());
    DioHelper.getData(
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

  ////////////////////////? Change Password /////////////////////////////
  ChangePasswordModel? changePasswordModel;
  void changeAccPassword({
    required String currentPassword,
    required String newPassword,
  }) {
    emit(ChangePasswordLoadingState());
    DioHelper.postData(
      url: changePassword,
      token: CashHelper.getData(key: tOKENCONST),
      data: {
        'current_password': currentPassword,
        'new_password': newPassword,
      },
    ).then((value) {
      changePasswordModel = ChangePasswordModel.fromJson(value.data);
      emit(ChangePasswordSuccessState(
          changePasswordModel: changePasswordModel!));
      getProfileInfo();
    }).catchError((error) {
      emit(ChangePasswordFailureState(errMessage: error.toString()));
    });
  }

//////////////////////////////////////? LOGOUT //////////////////////////////////
  void userLogout(BuildContext context, {required String routName}) async {
    emit(LogoutLoadingState());
    return await DioHelper.postData(
            url: logout, token: CashHelper.getData(key: tOKENCONST))
        .then((value) {
      navigatorPushAndRemove(context, routName);
      CashHelper.deleteCash(key: tOKENCONST);
      CashHelper.deleteCash(key: customerID);
      emit(LogoutSuccussState(logoutModel: LogoutModel.fromJson(value.data)));
    }).catchError((err) {
      emit(GetHomeDataFailureState(errMessage: err.toString()));
    });
  }

///////////////// Add and remove  from Cart /////////////////////////////

  ChangedFavoriteModel? changedCartModel;

  void addAndRemoveCart({required int productId}) {
    inCartProductsMap[productId] = !inCartProductsMap[productId]!;
    emit(CartLoadingState());
    DioHelper.postData(
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
  void getCartItems() {
    emit(GetCartLoadingState());
    DioHelper.getData(
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
  }) {
    emit(UpdateCartLoadingState());
    DioHelper.putData(
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
