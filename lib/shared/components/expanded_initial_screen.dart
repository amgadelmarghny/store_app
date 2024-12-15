import 'package:flutter/material.dart';

class ExpandedInitialScreen extends StatelessWidget {
  const ExpandedInitialScreen({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.amber,
            height: 400,
          ),
          Icon(
            icon,
            size: 200,
            color: Colors.grey,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
