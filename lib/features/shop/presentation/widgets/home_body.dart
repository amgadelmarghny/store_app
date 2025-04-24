import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/widgets/custom_refresh_page.dart';
import 'package:soagmb/features/shop/presentation/widgets/products_and_banners_view.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:soagmb/core/global/style/colors.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (context, state) {
        ShopCubit shopCubit = ShopCubit.get(context);
        return CustomRefreshPage(
          onRefresh: () async {
            shopCubit.getCategories();
            await shopCubit.getHomeData();
          },
          child: ConditionalBuilder(
            condition: shopCubit.homeModel != null &&
                shopCubit.categoryHomeModel != null,
            builder: (context) => const ProductAndBannerView(),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(
                color: defaultColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
