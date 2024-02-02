import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/shared/bloc/app_cupit/app_cubit.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});
  static String id = 'ShopView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          return BlocBuilder<ShopCubit, ShopStates>(
            builder: (context, state) {
              List<Widget> draverItems =
                  BlocProvider.of<ShopCubit>(context).listMenu(
                context,
                onSelected: (value) {
                  if (value == 1) {
                    BlocProvider.of<AppCubit>(context).britnessChanged();
                  } else if (value == 2) {
                  } else if (value == 3) {
                   
                  }
                },
              );
              return Scaffold(
                drawer: Drawer(
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
          );
        },
      ),
    );
  }
}
