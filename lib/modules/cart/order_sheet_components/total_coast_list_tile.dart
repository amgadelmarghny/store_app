import 'package:flutter/material.dart';

class TotalCoastListTile extends StatelessWidget {
  const TotalCoastListTile({
    super.key,
    this.total,
  });
  final dynamic total;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Total Coast'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text('EGP', style: Theme.of(context).textTheme.titleSmall!),
          Text(
            total.toString(),
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}