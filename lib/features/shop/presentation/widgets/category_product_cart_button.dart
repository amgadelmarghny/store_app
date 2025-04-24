import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';

class CategoryProductCartButton extends StatelessWidget {
  const CategoryProductCartButton({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  Widget build(BuildContext context) {
    ShopCubit shopCubit = BlocProvider.of<ShopCubit>(context);
    return IconButton(
      onPressed: () {
        shopCubit.addAndRemoveCart(productId: productId);
      },
      icon: Icon(
        shopCubit.inCartProductsMap[productId]!
            ? Icons.shopping_cart
            : Icons.shopping_cart_outlined,
        color: BlocProvider.of<ShopCubit>(context)
                .inCartProductsMap[productId]!
            ? Colors.red
            : Colors.grey,
      ),
    );
  }
}
