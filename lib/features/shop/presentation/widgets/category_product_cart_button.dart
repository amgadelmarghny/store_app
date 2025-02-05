import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/domain/entities/product.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';

class CategoryProductCartButton extends StatelessWidget {
  const CategoryProductCartButton({
    super.key,
    required this.productModel,
  });

  final Product productModel;

  @override
  Widget build(BuildContext context) {
    ShopCubit shopCubit = BlocProvider.of<ShopCubit>(context);
    return IconButton(
      onPressed: () {
        shopCubit.addAndRemoveCart(productId: productModel.id);
      },
      icon: Icon(
        shopCubit.inCartProductsMap[productModel.id]!
            ? Icons.shopping_cart
            : Icons.shopping_cart_outlined,
        color: BlocProvider.of<ShopCubit>(context)
                .inCartProductsMap[productModel.id]!
            ? Colors.red
            : Colors.grey,
      ),
    );
  }
}