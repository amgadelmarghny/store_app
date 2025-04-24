import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/presentation/widgets/discount_widget.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    this.discountPadding = false,
    required this.image,
    required this.discount,
  });

  final String image;
  final int discount;
  final bool discountPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CachedNetworkImage(
            imageUrl: image,
            width: double.infinity,
            height: 160,
          ),
          if (discount != 0)
            DiscountWidget(
              margin:
                  discountPadding ? EdgeInsets.only(left: 4, bottom: 2) : null,
            )
        ],
      ),
    );
  }
}
