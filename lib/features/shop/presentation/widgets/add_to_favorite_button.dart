import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/domain/entities/product.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';

class AddToFavoriteButton extends StatelessWidget {
  const AddToFavoriteButton({
    super.key,
    required this.productModel,
  });

  final Product productModel;

  @override
  Widget build(BuildContext context) {
    ShopCubit shopCubit = BlocProvider.of<ShopCubit>(context);

    return InkWell(
      onTap: () {
        shopCubit.addAndRemoveFavorite(id: productModel.id);
      },
      child: Icon(
        shopCubit.favoriteProductsMap[productModel.id]!
            ? Icons.favorite
            : Icons.favorite_border,
        color: shopCubit.favoriteProductsMap[productModel.id]!
            ? Colors.red
            : Colors.grey,
      ),
    );
  }
}