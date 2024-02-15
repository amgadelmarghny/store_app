import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static String id = 'SearchView';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Search'),
            ),
            body: Center(
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  BlocProvider.of<ShopCubit>(context).getCategories();
                },
              ),
            ));
      },
    );
  }
}
