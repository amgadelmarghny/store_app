import 'package:flutter/material.dart';

class CustomSliverRowText extends StatelessWidget {
  const CustomSliverRowText({
    super.key,
    required this.alertSentence,
    required this.text,
    required this.routeName,
  });
  final String alertSentence;
  final String text;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              alertSentence,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, routeName);
              },
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
