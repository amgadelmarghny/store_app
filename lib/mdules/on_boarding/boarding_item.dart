import 'package:flutter/material.dart';
import 'package:store_2/models/boarding_model.dart';
import 'package:store_2/shared/style/colors.dart';

class BoardingBuilder extends StatelessWidget {
  const BoardingBuilder({super.key, required this.boardModel});
  final BoardModel boardModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(boardModel.image),
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          boardModel.shopeTitle,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: defaultColor,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          boardModel.shopeSubTitle,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
