import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/models/shop_models/product_model.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:soagmb/shared/components/custom_button.dart';
import 'package:soagmb/shared/components/custom_show_messages.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is CartSussiccState) {
          toastShown(
            message: state.changedCartModel.message,
            state: ToastState.success,
            context: context,
          );
        }
        if (state is CartFailureState) {
          toastShown(
            message: state.errMessage,
            state: ToastState.error,
            context: context,
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CustomButton(
            prefixIcon: BlocProvider.of<ShopCubit>(context)
                .inCartProductsMap[productModel.id]!,
            isLoading: state is CartLoadingState,
            text: BlocProvider.of<ShopCubit>(context)
                    .inCartProductsMap[productModel.id]!
                ? 'Remove from Cart'
                : 'Add to Cart',
            onTap: () {
              BlocProvider.of<ShopCubit>(context).addAndRemoveCart(
                productId: productModel.id,
              );
            },
          ),
        );
      },
    );
  }
}
