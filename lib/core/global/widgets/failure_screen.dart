import 'package:flutter/material.dart';
import 'package:soagmb/generated/l10n.dart';

class FailureScreen extends StatelessWidget {
  const FailureScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.warning_amber,
            color: Colors.red,
            size: 200,
          ),
          Text(S.of(context).somthing_went_wrong),
          Text(S.of(context).please_try_again_later),
        ],
      ),
    );
  }
}
