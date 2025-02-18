import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/presentation/widgets/complaint_dialog_builder.dart';
import 'package:soagmb/generated/l10n.dart';

class ComplaintContainer extends StatelessWidget {
  const ComplaintContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return const ComplaintDialogBuilder();
              });
        },
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 38,
                  color: Colors.black,
                ),
                Text(
                  S.of(context).what_is_the_problem_you_are_facting,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
