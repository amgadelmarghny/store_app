import 'package:flutter/material.dart';

class OrderSheet extends StatelessWidget {
  const OrderSheet({
    super.key,
    this.total,
  });
  final dynamic total;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 4,
              width: 35,
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(30)),
            )
          ],
        ),
        ListTile(
          title: const Text('Payment method'),
          onTap: () {},
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        const Divider(
          endIndent: 20,
          indent: 20,
        ),
        ListTile(
          title: const Text('Address'),
          onTap: () {},
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        const Divider(
          endIndent: 20,
          indent: 20,
        ),
        ListTile(
          title: const Text('Total Coast'),
          onTap: () {},
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('EGP', style: Theme.of(context).textTheme.titleSmall!),
              Text(
                total.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
