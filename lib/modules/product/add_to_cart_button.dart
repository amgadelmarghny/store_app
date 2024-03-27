
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/models/shope_models/product_model.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/components/custom_buttomt.dart';
import 'package:store_2/shared/style/colors.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.productModel,
    required this.state,
  });

  final ProductModel productModel;
  final ShopStates state;
  

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      prefixIcon: BlocProvider.of<ShopCubit>(context)
          .inCartProductsMap[productModel.id]!,
      isLoading: state is CartLoadingState,
      color: defaultColor[300]!,
      text: BlocProvider.of<ShopCubit>(context)
              .inCartProductsMap[productModel.id]!
          ? 'Remove from Cart'
          : 'Add to Cart',
      onTap: () {
        BlocProvider.of<ShopCubit>(context).addAndRemoveCart(
          productId: productModel.id,
        );
      },
    );
  }
}
