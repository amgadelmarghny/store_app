import 'package:flutter/material.dart';

class CurveColorUI extends StatelessWidget {
  const CurveColorUI({
    super.key,
    required this.headLine,
    required this.subHeadline,
    required this.color,
  });
  final String headLine;
  final String subHeadline;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            color: color,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
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
        Positioned(
          bottom: 0,
          child: Container(
            height: 120,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.only(topLeft: Radius.circular(100)),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Center(
              child: Text(
                subHeadline,
                style: Theme.of(context).textTheme.bodyLarge!,
              ),
            ),
          ),
        )
      ],
    );
  }
}
