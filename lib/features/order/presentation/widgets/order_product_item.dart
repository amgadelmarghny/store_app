import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/order/domain/entities/products_order.dart';
import 'package:soagmb/shared/bloc/app_cubit/app_cubit.dart';

class OrderProductItem extends StatelessWidget {
  const OrderProductItem({super.key, required this.productModel});
  final ProductsOrder productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      clipBehavior: Clip.hardEdge,
      // decoration: ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 0.5,
          color: BlocProvider.of<AppCubit>(context).isDark
              ? Colors.grey.shade400
              : Colors.black87,
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      height: 90,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: productModel.image,
            fit: BoxFit.cover,
            height: 90,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                color: Colors.teal,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    productModel.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          height: 1.2,
                          fontSize: 20,
                        ),
                  ),
                ),
                Text(
                  'quantity : ${productModel.quantity}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 16),
                ),
                Text(
                  'Price : ${productModel.price} EGP',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 16, height: 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
