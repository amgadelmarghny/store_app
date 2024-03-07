import 'package:flutter/material.dart';
import 'package:store_2/models/shope_models/product_model.dart';
import 'package:store_2/shared/components/custom_buttomt.dart';
import 'package:store_2/shared/style/colors.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});
  static const String id = '/product-view';

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  bool isMore = false;
  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 16),
        child: ListView(
          children: [
            Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: Image.network(productModel.image)),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('EGP', style: Theme.of(context).textTheme.titleSmall!),
                Text(
                  productModel.price.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 24),
                ),
                const SizedBox(width: 50),
                if (productModel.discount != 0)
                  Text(
                    productModel.oldPrice.toString(),
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                  ),
                const SizedBox(width: 50),
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
              height: 10,
            ),
            Text(
              productModel.name!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(height: 1.2),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              maxLines: isMore ? 1000 : 10,
              productModel.description!,
              overflow: TextOverflow.ellipsis,
              style:
                  const TextStyle(color: Colors.grey, fontSize: 18, height: 1),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isMore = !isMore;
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isMore ? 'Show less' : 'Show more',
                  ),
                  Icon(isMore
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              color: defaultColor[300]!,
              text: 'Add to Cart',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              color: defaultColor[600]!,
              text: 'Buy Now',
            ),
          ],
        ),
      ),
    );
  }
}
