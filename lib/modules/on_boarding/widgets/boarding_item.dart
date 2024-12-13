import 'package:flutter/material.dart';
import 'package:soagmb/models/boarding_model.dart';
import 'package:soagmb/shared/style/colors.dart';
import 'package:soagmb/shared/style/themes.dart';

class BoardingItem extends StatelessWidget {
  const BoardingItem({super.key, required this.boardModel});
  final BoardModel boardModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Center(
            child: Image.asset(boardModel.image),
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            boardModel.shopTitle,
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
            boardModel.shopSubTitle,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: getResponsiveFontSize(fontSize: 20),
                ),
          ),
        ),
      ],
    );
  }
}
