import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Sourban/modules/product/product_view.dart';
import 'package:Sourban/models/shope_models/product_model.dart';
import 'package:Sourban/shared/bloc/shop_cubit/shop_cubit.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productModel,
    this.isCategory = false,
  });
  final bool isCategory;
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductView.id,
          arguments: {'productModel': productModel},
        );
      },
      child: BlocBuilder<ShopCubit, ShopStates>(
        builder: (context, state) {
          ShopCubit shopCubit = BlocProvider.of<ShopCubit>(context);
          return Container(
            clipBehavior: Clip.hardEdge,
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
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      CachedNetworkImage(
                        imageUrl: productModel.image,
                        width: double.infinity,
                        height: 160,
                      ),
                      if (productModel.discount != 0)
                        Container(
                          margin: isCategory
                              ? const EdgeInsets.only(left: 2, bottom: 2)
                              : null,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.red[300],
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            'DISCOUNT',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                            ),
                          //////////////!//////////////!//////////!
                          if (isCategory)
                            IconButton(
                              onPressed: () {
                                shopCubit.addAndRemoveCart(
                                    productId: productModel.id);
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
                            ),
                          //////////////!//////////////!//////////!
                          IconButton(
                            onPressed: () {
                              shopCubit.addAndRemoveFavorite(
                                  id: productModel.id);
                            },
                            icon: Icon(
                              shopCubit.favoriteProductsMap[productModel.id]!
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: shopCubit
                                      .favoriteProductsMap[productModel.id]!
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
