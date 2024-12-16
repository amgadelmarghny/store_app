import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/modules/home/widgets/banner_item_list_view.dart';
import 'package:soagmb/modules/home/widgets/categories_section.dart';
import 'package:soagmb/modules/home/widgets/products_section.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';

class ProductAndBannerView extends StatelessWidget {
  const ProductAndBannerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ShopCubit shopCubit = BlocProvider.of<ShopCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerItemListView(),
            const SizedBox(
              height: 15,
            ),
            if (shopCubit.categoryHomeModel?.dataCatHome?.dataList != null)
              CategoriesSection(),
            const SizedBox(
              height: 15,
            ),
            if (shopCubit.homeModel?.data?.productsList != null)
              Productssection(),
          ],
        ),
      ),
    );
  }
}
