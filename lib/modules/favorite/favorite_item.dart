import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/modules/favorite/product_image.dart';
import 'package:store_2/modules/product/product_view.dart';
import 'package:store_2/models/shope_models/product_model.dart';
import 'package:store_2/modules/product/quantity_counter.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
    required this.productModel,
    this.isSearch = false,
    this.isCart = false,
    this.cartID,
  });
  final bool isSearch;
  final ProductModel productModel;
  final bool isCart;
  final int? cartID;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductView.id,
          arguments: {
            'productModel': productModel,
            'isCart': isCart,
            'isSearch': isSearch,
            'cartID': cartID,
          },
        );
      },
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            ProductImageFavItem(productModel: productModel, isSearch: isSearch),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(height: 1, color: Colors.black),
                    ),
                    const SizedBox(height: 3),
                    if (!isCart)
                      Text(
                        productModel.description!,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.grey, fontSize: 15, height: 1),
                      )
                    else if (cartID != null)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          QuantityCounter(
                              cartID: cartID!, productModel: productModel),
                        ],
                      ),
                    const Spacer(),
                    BlocBuilder<ShopCubit, ShopStates>(
                      builder: (context, state) {
                        ShopCubit shopCubit =
                            BlocProvider.of<ShopCubit>(context);
                        return Row(
                          children: [
                            Text(
                              productModel.price.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 15),
                            ),
                            const Spacer(),
                            if (!isSearch)
                              if (productModel.discount != 0)
                                Text(
                                  productModel.oldPrice.toString(),
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),
                            if (BlocProvider.of<ShopCubit>(context)
                                    .favoriteProductsMap[productModel.id] !=
                                null)
                              // if favorite product item used in Favorite View - Favorites button will enable
                              if (!isCart)
                                IconButton(
                                  onPressed: () {
                                    shopCubit.addAndRemoveFavorite(
                                        id: productModel.id);
                                    shopCubit.getFavoriteProducts();
                                  },
                                  icon: Icon(
                                    shopCubit.favoriteProductsMap[
                                            productModel.id]!
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: shopCubit.favoriteProductsMap[
                                            productModel.id]!
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                )
                              // but if favorite product item used in Cart View - Cart button will enable
                              // and fav button will disapper
                              else
                                IconButton(
                                  onPressed: () {
                                    shopCubit.addAndRemoveCart(
                                        productId: productModel.id);
                                  },
                                  icon: Icon(
                                    shopCubit
                                            .inCartProductsMap[productModel.id]!
                                        ? Icons.shopping_cart
                                        : Icons.shopping_cart_outlined,
                                    color: BlocProvider.of<ShopCubit>(context)
                                            .inCartProductsMap[productModel.id]!
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                )
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
