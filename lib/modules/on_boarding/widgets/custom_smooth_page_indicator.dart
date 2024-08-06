import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:Sourban/shared/bloc/app_cubit/app_cubit.dart';
import 'package:Sourban/shared/style/colors.dart';

SmoothPageIndicator customSmoothPageIndicator(
    PageController pageController, AppCubit appCubit) {
  return SmoothPageIndicator(
    controller: pageController,
    count: appCubit.boardList.length,
    effect: const ExpandingDotsEffect(
      expansionFactor: 2,
      spacing: 7.0,
      dotWidth: 20.0,
      dotHeight: 10.0,
      paintStyle: PaintingStyle.stroke,
      strokeWidth: 2,
      dotColor: Colors.grey,
      activeDotColor: defaultColor,
    ),
  );
}
