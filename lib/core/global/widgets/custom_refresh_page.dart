import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:soagmb/core/global/style/colors.dart';

class CustomRefreshPage extends StatelessWidget {
  const CustomRefreshPage({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  final Widget child;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: onRefresh,
      backgroundColor: defaultColor[400],
      color: defaultColor[200],
      animSpeedFactor: 2,
      showChildOpacityTransition: false,
      child: child,
    );
  }
}