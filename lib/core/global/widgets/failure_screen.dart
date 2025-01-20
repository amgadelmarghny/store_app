import 'package:flutter/material.dart';

class FailureScreen extends StatelessWidget {
  const FailureScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.warning_amber,
          color: Colors.red,
          size: 200,
        ),
        Text('Something went wrong\nPlease try again later'),
      ],
    );
  }
}