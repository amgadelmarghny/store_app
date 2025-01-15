import 'package:flutter/material.dart';
import 'package:soagmb/core/global/widgets/empty_screen.dart';
import 'package:soagmb/features/shop/presentation/views/add_address_view.dart';
import 'package:soagmb/core/global/style/colors.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_button.dart';

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
              itemName: 'address',
            ),
          ),
          CustomButton(
            text: 'Add New Address',
            onTap: () {
              Navigator.pushNamed(context, AddAddressView.id);
            },
          ),
        ],
      ),
    );
  }
}
