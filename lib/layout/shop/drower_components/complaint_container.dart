import 'package:flutter/material.dart';
import 'package:store_2/layout/shop/drower_components/complaint_dialog_builder.dart';

class ComplaintContainer extends StatelessWidget {
  const ComplaintContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return const ComplaintDialogBuilder();
            });
      }, // Add complaint details
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 4,
              color: Colors.black87.withOpacity(0.45),
            )
          ],
          color: Colors.yellow[800]!.withOpacity(0.7),
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
      ),
    );
  }
}
