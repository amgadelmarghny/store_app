import 'package:flutter/material.dart';

class ComplaintContainer extends StatelessWidget {
  const ComplaintContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 4,
            color: Colors.black87.withOpacity(0.4),
          )
        ],
        color: Colors.amber[800]!.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.error_outline,
            size: 38,
          ),
          Text(
            'What\'s the problem you are facting',
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
