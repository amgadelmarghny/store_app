import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/data/models/boarding_model.dart';
import 'package:soagmb/core/global/style/colors.dart';
import 'package:soagmb/core/global/style/themes.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({super.key, required this.onBoardModel});
  final OnBoardModel onBoardModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Center(
            child: Image.asset(onBoardModel.image),
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            onBoardModel.shopTitle,
            style: TextStyle(
              fontSize: getResponsiveFontSize(fontSize: 30),
              fontWeight: FontWeight.w500,
              color: defaultColor,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            onBoardModel.shopSubTitle,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: getResponsiveFontSize(fontSize: 20),
                ),
          ),
        ),
      ],
    );
  }
}
