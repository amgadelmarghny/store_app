import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/widgets/horizontal_product_item.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';

class FavoriteDataScreen extends StatelessWidget {
  const FavoriteDataScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ShopCubit shopCubit = BlocProvider.of<ShopCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.separated(
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return HorizontalProductItem(
            productModel: shopCubit.favoritesModel!.favoritesDataModel!
                .dataModelList[index].product!,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount:
            shopCubit.favoritesModel!.favoritesDataModel!.dataModelList.length,
      ),
    );
  }
}
