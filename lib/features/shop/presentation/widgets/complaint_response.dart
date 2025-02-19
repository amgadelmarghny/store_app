import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:soagmb/generated/l10n.dart';

class ComplaintResponse extends StatelessWidget {
  const ComplaintResponse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ShopCubit cubit = ShopCubit.get(context);
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            cubit.complaintModel!.message,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(S.of(context).complaint_number),
              Text(
                '${cubit.complaintModel!.complaintData!.id}',
                style: const TextStyle(decoration: TextDecoration.underline),
              )
            ],
          )
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            S.of(context).ok,
            style: TextStyle(color: Colors.teal),
          ),
        ),
      ],
    );
  }
}
