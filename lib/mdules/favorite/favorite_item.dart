import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/models/shope_models/product_model.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/network/lockal/key_const.dart';
import 'package:store_2/shared/network/lockal/shared_helper.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                width: 150,
                height: 150,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(
                  productModel.image,
                  fit: BoxFit.cover,
                ),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
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
                        .copyWith(height: 0.85),
                  ),
                  Text(
                    productModel.description!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 15, height: 0.9),
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
                      if (productModel.discount != 0)
                        Text(
                          productModel.oldPrice.toString(),
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(decoration: TextDecoration.lineThrough),
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
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
