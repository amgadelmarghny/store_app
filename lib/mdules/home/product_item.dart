import 'package:flutter/material.dart';
import 'package:store_2/models/shope_models/product_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 10,
            color: Colors.grey,
            offset: Offset(2, 6),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(
                  productModel.image,
                  width: double.infinity,
                  height: 100,
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
              productModel.name,
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
                Text(
                  productModel.oldPrice.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(decoration: TextDecoration.lineThrough),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
