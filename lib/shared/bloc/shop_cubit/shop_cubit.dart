import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_2/mdules/categories/categories_body.dart';
import 'package:store_2/mdules/favorite/favorite_body.dart';
import 'package:store_2/mdules/home/home_body.dart';
import 'package:store_2/models/catergory_model/catergory_model.dart';
import 'package:store_2/models/get_favorites_model/get_favorites_model.dart';
import 'package:store_2/models/logout_model/logout_model.dart';
import 'package:store_2/models/shope_models/home_model.dart';
import 'package:store_2/models/shope_models/product_model.dart';
import 'package:store_2/shared/network/lockal/key_const.dart';
import 'package:store_2/shared/network/lockal/shared_helper.dart';
import 'package:store_2/shared/network/remot/dio_helper.dart';
import 'package:store_2/shared/network/remot/end_points_url.dart';

import '../../../models/fav_model/favorite_model.dart';
part 'shop_state.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitial());

  List<Widget>? draverItems;

  List<Widget> listMenu(context, {required Function(int)? onSelected}) {
    return draverItems = [
      PopupMenuButton(
        onSelected: onSelected,
        child: const ListTile(
          leading: Icon(Icons.settings_outlined),
          title: Text(
            'Settings',
          ),
          trailing: Icon(Icons.keyboard_arrow_down),
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: ListTile(
              title: Text(
                'Britness (Light , Dark)',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              leading: const Icon(Icons.brightness_6_outlined),
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: ListTile(
              title: Text(
                'Language (En , Ar)',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              leading: const Icon(Icons.translate_outlined),
            ),
          ),
          PopupMenuItem(
            value: 3,
            child: ListTile(
              title: Text(
                'Logout',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              leading: const Icon(Icons.power_settings_new),
            ),
          ),
        ],
      ),
    ];
  }

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

  HomeModel? homeModel;
  Map<int, bool> favoriteProductsMap = {};

  void getHomeData() async {
    emit(GetHomeDataLoadingState());
    await DioHelper.get(
      token: CashHelper.getData(key: tOKENCONST),
      url: 'home',
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      for (var element in homeModel!.data!.productsList) {
        favoriteProductsMap.addAll({element.id: element.inFavorites!});
      }
      emit(GetHomeDataSuccessState());
    }).catchError((err) {
      emit(GetHomeDataFailureState(errMessage: err));
    });
  }

  List<DataModel> categoriesList = [];

  void getCategories() {
    emit(GetCategoriesLoadingState());
    try {
      DioHelper.get(url: categories).then(
        (value) {
          CategoriesModel categoryHomeModel =
              CategoriesModel.fromJson(value.data);
          for (var element in categoryHomeModel.dataCatHome!.data) {
            categoriesList.add(
              DataModel.fromJson(element),
            );
          }
        },
      );
      emit(GetCategoriesSuccessState());
    } catch (e) {
      emit(GetCategoriesFailureState(errMessage: e.toString()));
    }
  }

  ChangedFavoriteModel? changedFavoriteModel;

  void addAndRemoveFavorite({required int id, required String token}) async {
    favoriteProductsMap[id] = !favoriteProductsMap[id]!;
    emit(FavoriteLoadingState());
    await DioHelper.postData(
      url: favCONST,
      token: token,
      data: {"product_id": id},
    ).then((value) {
      changedFavoriteModel = ChangedFavoriteModel.fromJson(value.data);
      debugPrint('favvvvvvvv ::::::::: ${changedFavoriteModel!.message}');
      if (!changedFavoriteModel!.status) {
        favoriteProductsMap[id] = !favoriteProductsMap[id]!;
      }
      emit(FavoriteSussiccState(changedFavoriteModel: changedFavoriteModel!));
    }).catchError((err) {
      emit(FavoriteFailureState(errMessage: err));
    });
  }

  GetFavoritesModel? favoritesModel;
  List<Data> dataList = [];
  void getFavoriteProducts({required String token}) async {
    emit(GetFavoritesLoadingState());
    await DioHelper.get(url: favCONST, token: token).then((value) {
      dataList.clear();
      favoritesModel = GetFavoritesModel.fromJson(value.data);
      /// to get data list
      for (var element in favoritesModel!.favoritesDataModel!.dataModel!) {
        dataList.add(Data.fromJson(element));
      }
      emit(GetFavoritesSuccessState());
    });
  }

  Future userLogout({required String token}) async {
    emit(LogoutLoadingState());
    return await DioHelper.postData(url: logout, token: token).then((value) {
      emit(LogoutSuccussState(logoutModel: LogoutModel.fromJson(value.data)));
    }).catchError((err) {
      emit(GetHomeDataFailureState(errMessage: err.toString()));
    });
  }
}
