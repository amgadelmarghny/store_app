import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/modules/favorite/widgets/horizontal_favorite_item.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';

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
                .dataModelList[index].productModel!,
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
