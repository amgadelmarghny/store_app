import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/data/models/product_model.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_button.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';

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
        if (state is AddToCartSussiccState) {
          toastShown(
            message: state.changedCartModel.message,
            state: ToastState.success,
            context: context,
          );
        }
        if (state is AddToCartFailureState) {
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
          child: AbsorbPointer(
            absorbing: state is AddToCartLoadingState,
            child: CustomButton(
              prefixIcon: BlocProvider.of<ShopCubit>(context)
                  .inCartProductsMap[productModel.id]!,
              isLoading: state is AddToCartLoadingState,
              text: BlocProvider.of<ShopCubit>(context)
                      .inCartProductsMap[productModel.id]!
                  ? 'Remove from Cart'
                  : 'Add to Cart',
              onTap: () async {
                await BlocProvider.of<ShopCubit>(context).addAndRemoveCart(
                  productId: productModel.id,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
