import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/data/models/product_model.dart';
import 'package:soagmb/features/shop/presentation/widgets/quantity_counter.dart';
import 'package:soagmb/generated/l10n.dart';

class ProductPriceDetails extends StatelessWidget {
  const ProductPriceDetails(
      {super.key,
      required this.productModel,
      required this.fromCart,
      required this.isSearch,
      required this.cartID});
  final ProductModel productModel;
  final bool fromCart;
  final bool isSearch;
  final int cartID;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              if (productModel.discount != 0 && productModel.discount != null)
                OldPrice(
                    text: S.of(context).discount,
                    oldPrice: productModel.discount.toString()),
              if (productModel.discount != 0 && productModel.discount != null)
                OldPrice(
                  oldPrice: productModel.oldPrice.toString(),
                  text: S.of(context).old_price,
                ),
              Price(
                price: productModel.price.toString(),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        if (fromCart)
          QuantityCounter(
            cartID: cartID,
            productModel: productModel,
          ),
      ],
    );
  }
}

class OldPrice extends StatelessWidget {
  const OldPrice({
    super.key,
    required this.oldPrice,
    required this.text,
  });
  final String text;
  final String oldPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 18,
              ),
        ),
        const Spacer(),
        Text(
          oldPrice,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                decoration: TextDecoration.lineThrough,
              ),
        ),
      ],
    );
  }
}

class Price extends StatelessWidget {
  const Price({
    super.key,
    required this.price,
  });
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).price,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
        ),
        const Spacer(),
        Text('EGP', style: Theme.of(context).textTheme.titleSmall!),
        Text(
          price,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}
