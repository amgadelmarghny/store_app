import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:soagmb/core/global/cubits/app_cubit/app_cubit.dart';
import 'package:soagmb/core/global/style/colors.dart';

SmoothPageIndicator customSmoothPageIndicator(
    PageController pageController, BuildContext context) {
  AppCubit appCubit = BlocProvider.of<AppCubit>(context);
  return SmoothPageIndicator(
    controller: pageController,
    count: appCubit.boardList(context).length,
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
