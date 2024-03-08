import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: IconButton(
            onPressed: () {
              BlocProvider.of<ShopCubit>(context).getCartItems();
            },
            icon: const Icon(Icons.abc)));
  }
}
