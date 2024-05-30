import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:Sourban/models/shope_models/product_model.dart';
import 'package:Sourban/shared/style/colors.dart';

class SmoothIndecator extends StatelessWidget {
  const SmoothIndecator({
    super.key,
    required this.pageController,
    required this.productModel,
  });

  final PageController pageController;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SmoothPageIndicator(
          effect: WormEffect(
            activeDotColor: defaultColor.shade200,
            dotHeight: 10,
            dotWidth: 10,
            dotColor: Colors.grey.shade400,
          ),
          controller: pageController,
          count: productModel.images != null ? productModel.images!.length : 1,
        ),
      ],
    );
  }
}
