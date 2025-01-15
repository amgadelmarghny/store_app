import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:soagmb/models/address_models/address_model.dart';
import 'package:soagmb/features/shop/presentation/widgets/menu_items.dart';
import 'package:soagmb/features/shop/presentation/widgets/address_order_item_leading.dart';
import 'package:soagmb/core/global/style/colors.dart';

class AddressOrderItem extends StatelessWidget {
  const AddressOrderItem({
    super.key,
    required this.addressModel,
    required this.isActive,
  });

  final AddressModel addressModel;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 500),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 5),
        leading: AddressOrderItemLeading(isActive: isActive),
        title: Text(addressModel.name),
        subtitle: Text('${addressModel.city}, ${addressModel.region}'),
        trailing: IconButton(
          onPressed: () {
            onPress(context);
          },
          icon: const Icon(Icons.more_vert),
        ),
      ),
    );
  }

  void onPress(BuildContext context) {
    showPopover(
      backgroundColor: defaultColor[300]!,
      context: context,
      bodyBuilder: (context) => MenuItems(
        addressModel: addressModel,
      ),
      width: MediaQuery.sizeOf(context).width / 1.5,
      height: 100,
    );
  }
}
