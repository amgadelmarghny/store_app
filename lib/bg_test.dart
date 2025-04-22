import 'package:flutter/material.dart';
import 'package:soagmb/core/global/style/colors.dart';

class BgTest extends StatelessWidget {
  const BgTest({super.key});
  static const id = 'cdevreb';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: defaultColor,
        gradient: LinearGradient(
          colors: [
            defaultColor[600]!,
            defaultColor[200]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(),
    );
  }
}
