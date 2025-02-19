import 'package:flutter/material.dart';
import 'package:soagmb/generated/l10n.dart';

class TotalCoastListTile extends StatelessWidget {
  const TotalCoastListTile({
    super.key,
    this.total,
  });
  final dynamic total;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:  Text(S.of(context).total_coast),
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
