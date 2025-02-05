import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:soagmb/features/shop/data/models/product_model.dart';
import 'package:soagmb/features/shop/presentation/widgets/add_to_cart_button.dart';
import 'package:soagmb/features/shop/presentation/widgets/price_row.dart';
import 'package:soagmb/features/shop/presentation/widgets/product_images_collection.dart';
import 'package:soagmb/features/shop/presentation/widgets/smoth_page_idecator.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({
    super.key,
    required this.productModel,
    required this.fromCart,
    required this.isSearch,
    required this.cartID,
  });
  final ProductModel productModel;
  final bool fromCart;
  final bool isSearch;
  final int cartID;

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();

    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              ProductImagesCollection(
                pageController: pageController,
                productModel: productModel,
              ),
              const SizedBox(height: 8),
              SmoothIndicator(
                pageController: pageController,
                productModel: productModel,
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
                height: 20,
              ),
              ProductPriceDetails(
                productModel: productModel,
                fromCart: fromCart,
                isSearch: isSearch,
                cartID: cartID,
              ),
              const SizedBox(
                height: 10,
              ),
              //product details
              ReadMoreText(
                productModel.description!,
                trimLines: 12,
                style: const TextStyle(
                    color: Colors.grey, fontSize: 15.5, height: 1.2),
                colorClickableText: Colors.teal,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Read more',
                trimExpandedText: 'Read less',
                moreStyle: const TextStyle(color: Colors.teal),
              )
            ],
          ),
        ),
        AddToCartButton(productModel: productModel),
      ],
    );
  }
}
