import 'package:flutter/material.dart';
import 'package:soagmb/core/global/style/colors.dart';
import 'package:soagmb/core/global/style/themes.dart';
import 'package:soagmb/features/shop/presentation/views/shop_view.dart';
import 'package:soagmb/features/shop/presentation/widgets/navigation.dart';
import 'package:soagmb/generated/l10n.dart';

class AddToOrderDialog extends StatelessWidget {
  const AddToOrderDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(S.of(context).your_order_is_confirmed),
      actions: <Widget>[
        TextButton(
          child: Text(
            S.of(context).back_to_home,
            style: TextStyle(
                fontSize: getResponsiveFontSize(fontSize: 18),
                color: defaultColor),
          ),
          onPressed: () {
            navigatorPushAndRemove(context, ShopView.id);
          },
        ),
      ],
    );
  }
}
