import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/mdules/home/products_and_banners_view.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/componants/custom_show_messeges.dart';
import 'package:store_2/shared/style/colors.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        ShopCubit shopCubit = BlocProvider.of<ShopCubit>(context);
        if (shopCubit.homeModel!.message != null) {
          if (shopCubit.homeModel!.status) {
            toastShown(
              messege: shopCubit.homeModel!.message!,
              state: ToastState.success,
              context: context,
            );
          } else {
            toastShown(
              messege: shopCubit.homeModel!.message!,
              state: ToastState.error,
              context: context,
            );
          }
        }
      },
      builder: (context, state) {
        ShopCubit shopCubit = BlocProvider.of<ShopCubit>(context);
        return ConditionalBuilder(
          condition: shopCubit.homeModel != null &&
              shopCubit.categoriesList.isNotEmpty,
          builder: (context) => const ProductAndBannerView(),
          fallback: (contex) => const Center(
            child: CircularProgressIndicator(
              color: defaultColor,
            ),
          ),
        );
      },
    );
  }
}
