import 'package:flutter/material.dart';
import '../../shared/style/colors.dart';

class QuantityCounter extends StatefulWidget {
  const QuantityCounter({super.key});

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  int quantityNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            quantityNumber--;
            setState(() {});
          },
          icon: const Icon(Icons.remove, color: Colors.grey),
        ),
        Container(height:40,
          width: 40,
          //padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: const [
              BoxShadow(
                spreadRadius: 1.5,
                color: Color(0xFFE2E2E2),
              )
            ],
          ),
          child: Center(
            child: Text(
              quantityNumber.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            quantityNumber++;
            setState(() {});
          },
          icon: const Icon(Icons.add, color: defaultColor),
        ),
      ],
    );
  }
}
