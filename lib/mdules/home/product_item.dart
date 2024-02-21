import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/models/shope_models/product_model.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/network/lockal/key_const.dart';
import 'package:store_2/shared/network/lockal/shared_helper.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0.3,
                blurRadius: 5,
                color: Colors.grey.withOpacity(0.6),
                offset: const Offset(1, 5),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.network(
                      productModel.image,
                      width: double.infinity,
                      height: 160,
                    ),
                    if (productModel.discount != 0)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: Colors.red[300],
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'DISCOUND',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  productModel.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(height: 1.2),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      productModel.price.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 15),
                    ),
                    const Spacer(),
                    if (productModel.discount != 0)
                      Text(
                        productModel.oldPrice.toString(),
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              decoration: TextDecoration.lineThrough,
                            ),
                      ),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<ShopCubit>(context)
                            .addAndRemoveFavorite(
                          id: productModel.id,
                          token: CashHelper.getData(key: tOKENCONST),
                        );
                      },
                      icon: Icon(
                        BlocProvider.of<ShopCubit>(context)
                                .favoriteProductsMap[productModel.id]!
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: BlocProvider.of<ShopCubit>(context)
                                .favoriteProductsMap[productModel.id]!
                            ? Colors.red
                            : Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
