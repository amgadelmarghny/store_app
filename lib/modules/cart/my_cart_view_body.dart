import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/modules/cart/widgets/my_cart_data_screen.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:soagmb/shared/components/expanded_initial_screen.dart';
import 'package:soagmb/shared/style/colors.dart';

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
          return ExpandedInitialScreen(
            icon: Icons.shopping_cart_outlined,
            text: 'The cart is empty',
          );
        } else if (state is GetCartFailureState) {
          return const Center(child: Text('There is an error'));
        }
        return ConditionalBuilder(
          condition: state is! GetCartLoadingState &&
              state is! CartLoadingState &&
              state is! GetCartLoadingState &&
              state is! CartSussiccState,
          builder: (context) => MyCartDataScreen(
            cartItemList: cartItemList,
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
