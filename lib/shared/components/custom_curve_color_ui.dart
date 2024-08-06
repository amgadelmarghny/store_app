import 'package:flutter/material.dart';
import 'package:soagmb/shared/style/colors.dart';

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
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Container(
          width: w,
          height: h * 0.3 - 10,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                defaultColor[600]!,
                defaultColor[200]!,
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: h * 0.15 - 60),
                child: Text(
                  headLine,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(
                100,
              ),
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
        ),
      ],
    );
  }
}
