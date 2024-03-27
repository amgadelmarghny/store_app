import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/modules/favorite/favorite_item.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/style/colors.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (context, state) {
        List<dynamic> cartItemList = BlocProvider.of<ShopCubit>(context)
                .cartModel
                ?.data!
                .cartItemsList ??
            [];

        if (cartItemList.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  color: defaultColor,
                  size: 80,
                ),
                Text('The cart is empty,'),
                Text('Please add some products'),
              ],
            ),
          );
        } else if (state is GetCartFailureState) {
          return const Center(child: Text('There is an error'));
        }
        return ConditionalBuilder(
          condition:
              state is! GetCartLoadingState && state is! CartLoadingState,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) => FavoriteItem(
              isCart: true,
              productModel: cartItemList[index].productModel,
              cartID: cartItemList[index].id,
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: cartItemList.length,
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(
              color: defaultColor,
            ),
          ),
        );
      },
    );
  }
}
