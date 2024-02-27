import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_2/mdules/categories/categories_body.dart';
import 'package:store_2/mdules/favorite/favorite_body.dart';
import 'package:store_2/mdules/home/home_body.dart';
import 'package:store_2/mdules/profile/profile_view.dart';
import 'package:store_2/models/catergory_model/catergory_model.dart';
import 'package:store_2/models/get_favorites_model/get_favorites_model.dart';
import 'package:store_2/models/logout_model/logout_model.dart';
import 'package:store_2/models/profile_model/profile_model.dart';
import 'package:store_2/models/shope_models/home_model.dart';
import 'package:store_2/shared/componants/avatar_pic.dart';
import 'package:store_2/shared/componants/navigation.dart';
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
      if (profileModel != null)
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, ProfileView.id);
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AvatarPic(image: profileModel!.user!.image!),
                    const SizedBox(height: 10),
                    Text(
                      profileModel!.user!.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    )
                  ],
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
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
/////////////////////////////////// GET  HOME  DATA ////////////////////////////
  HomeModel? homeModel;
  Map<int, bool> favoriteProductsMap = {};

  void getHomeData() {
    emit(GetHomeDataLoadingState());
    DioHelper.getData(
      url: 'home',
      token: authToken,
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

  String? authToken = CashHelper.getData(key: tOKENCONST);

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
      debugPrint('stateeee ::::::::: ${changedFavoriteModel!.status}');
      if (changedFavoriteModel!.status == true) {
        debugPrint('^^^^^^ get fav success ^^^^^^');
        getFavoriteProducts();
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
      navigatorPushAndRemove(context, routName);
      CashHelper.deleteCash(key: tOKENCONST);
      emit(LogoutSuccussState(logoutModel: LogoutModel.fromJson(value.data)));
    }).catchError((err) {
      emit(GetHomeDataFailureState(errMessage: err.toString()));
    });
  }
}
