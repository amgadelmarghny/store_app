import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_2/layout/shop/shop_view.dart';
import 'package:store_2/mdules/categories/categories_view.dart';
import 'package:store_2/mdules/favorite/favorite_view.dart';
import 'package:store_2/models/logout_model/logout_model.dart';
import 'package:store_2/shared/componants/navigation.dart';
import 'package:store_2/shared/network/remot/dio_helper.dart';
import 'package:store_2/shared/network/remot/end_points_url.dart';
part 'shop_state.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitial());

  List<Widget>? draverItems;

  List<Widget> listMenu(context, {required Function(int)? onSelected}) {
    return draverItems = [
      ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        leading: const Icon(Icons.favorite_outline),
        title: const Text(
          'Favorite',
        ),
        onTap: () {
          Navigator.pushNamed(context, FavoriteView.id);
        },
      ),
      ListTile(
        leading: const Icon(Icons.category_outlined),
        title: const Text(
          'Categories',
        ),
        onTap: () {
          Navigator.pushNamed(context, CategoriesView.id);
        },
      ),
      PopupMenuButton(
        onSelected: onSelected,
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
        child: const ListTile(
          leading: Icon(Icons.settings_outlined),
          title: Text(
            'Settings',
          ),
        ),
      ),
    ];
  }

  Future userLogout({required String token}) async {
    emit(LogoutLoading());
    return await DioHelper.postData(url: logout, token: token).then((value) {
      emit(LogoutSuccuss(logoutModel: LogoutModel.fromJson(value.data)));
    }).catchError((err) {
      emit(LogoutFailure(message: err.toString()));
    });
  }
}
