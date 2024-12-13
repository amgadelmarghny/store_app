import 'package:flutter/material.dart';

class SubtitleCurveColorContainer extends StatelessWidget {
  const SubtitleCurveColorContainer({
    super.key,
    required this.subHeadline2,
    required this.subHeadline,
  });

  final String? subHeadline2;
  final String subHeadline;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double hight = MediaQuery.sizeOf(context).height;
    
    return Container(
      height: hight * 0.14,
      width: width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(100),
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: subHeadline2 == null ? 30 : 0),
            child: Text(
              subHeadline,
              style: Theme.of(context).textTheme.bodyLarge!,
            ),
          ),
          Text(
            subHeadline2 ?? '',
            style: Theme.of(context).textTheme.bodyLarge!,
          )
        ],
      ),
    );
  }
}