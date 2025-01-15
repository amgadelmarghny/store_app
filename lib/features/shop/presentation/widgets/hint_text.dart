import 'package:flutter/material.dart';

class HintTextOrderSheet extends StatelessWidget {
  const HintTextOrderSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'By placing an order you agree to our',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 15,
                color: Colors.grey,
                fontFamily: '',
                height: 0,
                fontWeight: FontWeight.normal,
              ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 0),
              ),
              child: const Text('Terms'),
            ),
            Text(
              'and ',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 15,
                    color: Colors.grey,
                    fontFamily: '',
                    fontWeight: FontWeight.normal,
                  ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 0),
              ),
              child: const Text('Conditions'),
            ),
          ],
        ),
      ],
    );
  }
}
