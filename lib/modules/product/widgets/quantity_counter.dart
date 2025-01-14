import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/models/shop_models/product_model.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';
import '../../../core/global/style/colors.dart';

class QuantityCounter extends StatelessWidget {
  const QuantityCounter(
      {super.key, required this.cartID, required this.productModel});
  final int cartID;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (context, state) {
        ShopCubit shopCubit = BlocProvider.of<ShopCubit>(context);
        int quantityNumber = shopCubit.quantityNumberMap[productModel.id]!;
        return ConditionalBuilder(
          // condition to build indicator when quantity changed
          condition: shopCubit.productCheck != null
              // this to check if the product that u want to change
              // is the same one in the My cart liat or not
              // if yes, the indicator will show up
              ? (shopCubit.productCheck!.id == productModel.id)
                  ? state is! UpdateCartLoadingState &&
                      state is! GetCartLoadingState &&
                      state is! UpdateCartSuccessState
                  // if no it will be false and nothing will show up
                  : true
              : true,
          builder: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  if (quantityNumber != 1) {
                    shopCubit.productCheck = productModel;
                    quantityNumber = quantityNumber - 1;
                    BlocProvider.of<ShopCubit>(context)
                        .updateNumberOfItemInTheCart(
                      cartID: cartID,
                      numberOfItemsInTheCart: quantityNumber,
                    );
                  }
                },
                icon: Icon(Icons.remove, color: Colors.grey.shade600),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      color: Colors.grey.shade400,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    quantityNumber.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.black87),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  shopCubit.productCheck = productModel;
                  quantityNumber = quantityNumber + 1;
                  BlocProvider.of<ShopCubit>(context)
                      .updateNumberOfItemInTheCart(
                    cartID: cartID,
                    numberOfItemsInTheCart: quantityNumber,
                  );
                },
                icon: const Icon(Icons.add, color: defaultColor),
              ),
            ],
          ),
          fallback: (context) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 23),
            child: SizedBox(
              width: 136,
              child: LinearProgressIndicator(
                color: defaultColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
