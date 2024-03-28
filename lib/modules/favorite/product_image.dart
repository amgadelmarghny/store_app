import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_2/models/shope_models/product_model.dart';
import 'package:store_2/shared/style/colors.dart';

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
          height: 150,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: CachedNetworkImage(
            imageUrl: productModel.image,
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return const Center(
                child: CircularProgressIndicator(
                  color: defaultColor,
                ),
              );
            },
          ),
        ),
        if (!isSearch)
          if (productModel.discount != 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.red[300],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'DISCOUND',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            )
      ],
    );
  }
}
