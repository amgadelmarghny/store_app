import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/models/shope_models/product_model.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import '../../shared/style/colors.dart';

class QuantityCounter extends StatelessWidget {
  const QuantityCounter(
      {super.key, required this.cartID, required this.productModel});
  final int cartID;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (context, state) {
        int quantityNumber = BlocProvider.of<ShopCubit>(context)
            .quantityNumberMap[productModel.id]!;
        return ConditionalBuilder(
            condition: BlocProvider.of<ShopCubit>(context)
                .quantityNumberMap
                .isNotEmpty,
            builder: (context) => Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (quantityNumber != 1) {
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
                        color: Theme.of(context).scaffoldBackgroundColor,
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
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
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
            fallback: (context) => const CircularProgressIndicator(
                  color: defaultColor,
                ));
      },
    );
  }
}
