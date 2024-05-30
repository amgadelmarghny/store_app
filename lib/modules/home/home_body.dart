import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Sourban/modules/home/widgets/products_and_banners_view.dart';
import 'package:Sourban/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:Sourban/shared/style/colors.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: BlocProvider.of<ShopCubit>(context).homeModel != null &&
              BlocProvider.of<ShopCubit>(context).categoryHomeModel != null,
          builder: (context) => const ProductAndBannerView(),
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
