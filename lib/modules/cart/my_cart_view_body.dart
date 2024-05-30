import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Sourban/modules/cart/make_order_button.dart';
import 'package:Sourban/modules/favorite/widgets/favorite_item.dart';
import 'package:Sourban/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:Sourban/shared/style/colors.dart';

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
          condition: state is! GetCartLoadingState &&
              state is! CartLoadingState &&
              state is! GetCartLoadingState &&
              state is! CartSussiccState,
          builder: (context) => Column(
            children: [
              Expanded(
                child: ListView.separated(
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: MakeOrderButton(
                  total: BlocProvider.of<ShopCubit>(context)
                      .cartModel!
                      .data!
                      .total!
                      .toInt(),
                  productCoast: cartItemList[0].productModel.price,
                ),
              ),
            ],
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
