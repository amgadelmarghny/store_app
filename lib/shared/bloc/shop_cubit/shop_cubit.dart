import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_2/mdules/categories/categories_body.dart';
import 'package:store_2/mdules/favorite/favorite_body.dart';
import 'package:store_2/mdules/home/home_body.dart';
import 'package:store_2/models/catergory_model/catergory_model.dart';
import 'package:store_2/models/get_favorites_model/get_favorites_model.dart';
import 'package:store_2/models/logout_model/logout_model.dart';
import 'package:store_2/models/shope_models/home_model.dart';
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
      Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              height: 80,
              child: Image.network(
                'https://student.valuxapps.com/storage/assets/defaults/user.jpg',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'dvbfnnddgfhhhkkn',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            )
          ],
        ),
      ),
      const Divider(
        color: Colors.grey,
        height: 0,
        thickness: 1.3,
      ),
      const Spacer(),
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
/////////////////////////////////// GET  HOME  DATA ///////////////////////////////
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

///////////////////////////////////// GET  CATEGORY /////////////////////////////////
  List<DataModel> categoriesList = [];

  void getCategories() async {
    emit(GetCategoriesLoadingState());
    try {
      await DioHelper.get(url: categories).then(
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

  String? authToken = CashHelper.getData(key: tOKENCONST);

  /////////////////////////////// ADD  AND  REMOVE  FROM  FAVORITES /////////////////////
  ChangedFavoriteModel? changedFavoriteModel;

  void addAndRemoveFavorite({required int id}) async {
    favoriteProductsMap[id] = !favoriteProductsMap[id]!;
    emit(FavoriteLoadingState());
    await DioHelper.postData(
      url: favCONST,
      token: authToken,
      data: {"product_id": id},
    ).then((value) {
      changedFavoriteModel = ChangedFavoriteModel.fromJson(value.data);
      debugPrint('stateeee ::::::::: ${changedFavoriteModel!.status}');
      if (changedFavoriteModel!.status == true) {
        debugPrint('^^^^^^ get fav success ^^^^^^');
        getFavoriteProducts();
      } else {
        favoriteProductsMap[id] = !favoriteProductsMap[id]!;
      }
      emit(FavoriteSussiccState(changedFavoriteModel: changedFavoriteModel!));
    }).catchError((err) {
      emit(FavoriteFailureState(errMessage: err));
    });
  }

////////////////////////////////////// GET  FAVORITES //////////////////////////////
  GetFavoritesModel? favoritesModel;
  List<Data> dataList = [];

  void getFavoriteProducts() async {
    emit(GetFavoritesLoadingState());
    try {
      await DioHelper.get(url: favCONST, token: authToken).then(
        (value) {
          dataList.clear();
          favoritesModel = GetFavoritesModel.fromJson(value.data);

          /// to get data list
          for (var element in favoritesModel!.favoritesDataModel!.dataModel!) {
            dataList.add(Data.fromJson(element));
          }
        },
      );
      emit(GetFavoritesSuccessState());
    } on Exception catch (e) {
      emit(GetFavoritesFailureState(errMessage: e.toString()));
    }
  }

  Future userLogout() async {
    emit(LogoutLoadingState());
    return await DioHelper.postData(url: logout, token: authToken)
        .then((value) {
      emit(LogoutSuccussState(logoutModel: LogoutModel.fromJson(value.data)));
    }).catchError((err) {
      emit(GetHomeDataFailureState(errMessage: err.toString()));
    });
  }
}
