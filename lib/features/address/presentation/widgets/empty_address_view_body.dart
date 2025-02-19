import 'package:flutter/material.dart';
import 'package:soagmb/core/global/widgets/empty_screen.dart';
import 'package:soagmb/features/address/presentation/views/add_address_view.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_button.dart';
import 'package:soagmb/generated/l10n.dart';

class EmptyAddressViewBody extends StatelessWidget {
  const EmptyAddressViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: EmptyScreen(
              itemName: S.of(context).address,
            ),
          ),
          CustomButton(
            text: S.of(context).add_new_address,
            onTap: () {
              Navigator.pushNamed(context, AddAddressView.id);
            },
          ),
        ],
      ),
    );
  }
}
