import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_2/layout/shop/shop_view.dart';
import 'package:store_2/mdules/categories/categories_view.dart';
import 'package:store_2/mdules/favorite/favorite_view.dart';
import 'package:store_2/shared/style/colors.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());
  List<Widget> listMenu(context) {
    List<Widget> draverItems;
    return draverItems = [
      ListTile(
        leading: const Icon(Icons.shopping_cart_outlined),
        title: const Text(
          'Shop',
        ),
        onTap: () {
          Navigator.pushNamed(context, ShopView.id);
        },
      ),
      ListTile(
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
        position: PopupMenuPosition.under,
        color: defaultColor[200],
        onSelected: (value) {
          if (value == 1) {
          } else if (value == 2) {}
        },
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
            value: 1,
            child: ListTile(
              title: Text(
                'Language (En , Ar)',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              leading: const Icon(Icons.translate_outlined),
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
}
