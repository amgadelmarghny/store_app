import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/presentation/views/add_address_view.dart';
import 'package:soagmb/core/global/style/colors.dart';

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
          Image.asset(
            'lib/assets/images/empty_box.png',
            height: 200,
          ),
          const Text('No addresses found !'),
          MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: defaultColor.shade100,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            onPressed: () {
              Navigator.pushNamed(context, AddAddressView.id);
            },
            child: const Text(
              'Add New Address',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
