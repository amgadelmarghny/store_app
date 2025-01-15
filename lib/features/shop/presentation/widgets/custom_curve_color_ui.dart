import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/presentation/widgets/curve_color_container_head_title.dart';
import 'package:soagmb/features/shop/presentation/widgets/curve_color_container_sub_title.dart';

class CurveColorUI extends StatelessWidget {
  const CurveColorUI({
    super.key,
    required this.headLine,
    required this.subHeadline,
    this.subHeadline2,
  });
  final String headLine;
  final String subHeadline;
  final String? subHeadline2;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        HeadTilteGradientContainer(headLine: headLine),
        SubtitleCurveColorContainer(
          subHeadline2: subHeadline2,
          subHeadline: subHeadline,
        ),
      ],
    );
  }
}
