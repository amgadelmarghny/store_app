import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:soagmb/features/shop/data/models/product_model.dart';
import 'package:soagmb/core/global/style/colors.dart';

class ProductImagesCollection extends StatelessWidget {
  const ProductImagesCollection({
    super.key,
    required this.pageController,
    required this.productModel,
  });

  final PageController pageController;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.3 - 20,
      width: double.infinity,
      child: PageView.builder(
        controller: pageController,
        itemCount:
            productModel.images != null ? productModel.images!.length : 1,
        itemBuilder: (context, index) {
          return FullScreenWidget(
            disposeLevel: DisposeLevel.High,
            child: CachedNetworkImage(
              imageUrl: productModel.images != null
                  ? productModel.images![index]
                  : productModel.image,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: defaultColor,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          );
        },
      ),
    );
  }
}
