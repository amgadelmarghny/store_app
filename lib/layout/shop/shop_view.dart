import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/style/colors.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});
  static String id = 'ShopView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          List<Widget> draverItems =
              BlocProvider.of<ShopCubit>(context).listMenu(context);

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
