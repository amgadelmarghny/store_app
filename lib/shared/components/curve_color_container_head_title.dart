import 'package:flutter/material.dart';
import 'package:soagmb/core/global/style/colors.dart';
import 'package:soagmb/core/global/style/themes.dart';

class HeadTilteGradientContainer extends StatelessWidget {
  const HeadTilteGradientContainer({
    super.key,
    required this.headLine,
  });

  final String headLine;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double hight = MediaQuery.sizeOf(context).height;
    return Container(
      width: width,
      height: hight * 0.3 - 10,
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
          Center(
            child: SizedBox(
              height: hight * 0.15,
              child: Text(
                headLine,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getResponsiveFontSize(fontSize: 30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
