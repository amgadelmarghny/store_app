import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:soagmb/models/shop_models/product_model.dart';
import 'package:soagmb/modules/favorite/widgets/discount_widget.dart';
import 'package:soagmb/shared/style/colors.dart';

class ProductImageFavItem extends StatelessWidget {
  const ProductImageFavItem({
    super.key,
    required this.productModel,
    required this.isSearch,
  });

  final ProductModel productModel;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          width: 150,
          height: 154,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: CachedNetworkImage(
            imageUrl: productModel.image,
            fit: BoxFit.fitWidth,
            placeholder: (context, url) {
              return const Center(
                child: CircularProgressIndicator(
                  color: defaultColor,
                ),
              );
            },
          ),
        ),
        if (!isSearch && productModel.discount != 0) DiscountWidget()
      ],
    );
  }
}
