import 'package:flutter/material.dart';
import 'package:soagmb/shared/style/colors.dart';

class CategoryDetailsDataLoading extends StatelessWidget {
  const CategoryDetailsDataLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'lib/assets/images/category product.png',
              height: 160,
            ),
            const SizedBox(
              height: 10,
            ),
            const CircularProgressIndicator(
              color: defaultColor,
            ),
          ],
        ),
      ),
    );
  }
}
