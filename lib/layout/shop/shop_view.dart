import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/mdules/categories/categories_view.dart';
import 'package:store_2/mdules/favorite/favorite_view.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/style/colors.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});
  static String id = 'ShopView';

  @override
  Widget build(BuildContext context) {
    List<Widget> draverItems = [
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
      ListTile(
        leading: const Icon(Icons.settings_outlined),
        title: const Text(
          'Settings',
        ),
        onTap: () {},
      ),
    ];
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          return Scaffold(
            drawer: Drawer(
              backgroundColor: defaultColor[300],
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return draverItems[index];
                  },
                  separatorBuilder: (context, index) =>
                      const Divider(height: 0),
                  itemCount: draverItems.length),
            ),
            appBar: AppBar(
              title: const Text('Shop'),
            ),
          );
        },
      ),
    );
  }
}
