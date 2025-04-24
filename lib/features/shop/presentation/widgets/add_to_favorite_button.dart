import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';

class AddToFavoriteButton extends StatelessWidget {
  const AddToFavoriteButton({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  Widget build(BuildContext context) {
    ShopCubit shopCubit = BlocProvider.of<ShopCubit>(context);

    return InkWell(
      onTap: () {
        shopCubit.addAndRemoveFavorite(id: productId);
      },
      child: Icon(
        shopCubit.favoriteProductsMap[productId]!
            ? Icons.favorite
            : Icons.favorite_border,
        color: shopCubit.favoriteProductsMap[productId]!
            ? Colors.red
            : Colors.grey,
      ),
    );
  }
}
