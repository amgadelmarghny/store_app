import 'package:flutter/material.dart';
import 'package:store_2/modules/address/add_new_address/add_address_view.dart';
import 'package:store_2/shared/components/custom_buttomt.dart';
import 'package:store_2/shared/style/colors.dart';

class MakeOrderButton extends StatelessWidget {
  const MakeOrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: defaultColor[600]!,
      text: 'Make order',
      onTap: () {
        Navigator.pushNamed(context, AddAddressView.id);
      },
    );
  }
}