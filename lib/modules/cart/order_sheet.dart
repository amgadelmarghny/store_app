import 'package:flutter/material.dart';
import 'package:store_2/shared/components/custom_buttomt.dart';

class OrderSheet extends StatelessWidget {
  const OrderSheet({
    super.key,
    this.total,
  });
  final dynamic total;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
        const Divider(),
        ListTile(
          title: const Text('Address'),
          onTap: () {},
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        const Divider(),
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
        const Divider(),
        Text(
          'By placing an order you agree to our',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 14,
                color: Colors.grey,
                fontFamily: '',
                fontWeight: FontWeight.normal,
              ),
        ),
        Row(
          children: [
            TextButton(onPressed: () {}, child: const Text('Terms')),
            Text(
              'and',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14,
                    color: Colors.grey,
                    fontFamily: '',
                    fontWeight: FontWeight.normal,
                  ),
            ),
            TextButton(onPressed: () {}, child: const Text('Conditions')),
          ],
        ),
        const SizedBox(height: 20),
        const CustomButton(
          text: 'Place Order',
        ),
      ],
    );
  }
}
