import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:soagmb/features/address/domain/entities/address.dart';
import 'package:soagmb/features/address/presentation/widgets/delete_address_button.dart';
import 'package:soagmb/features/address/presentation/views/update_address_view.dart';
import 'package:soagmb/core/global/style/colors.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.addressModel,
  });

  final Address addressModel;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 300),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () => Navigator.pushNamed(
          context,
          UpdateAddressView.id,
          arguments: addressModel,
        ),
        leading: CircleAvatar(
          backgroundColor: defaultColor.shade200,
          child: const Icon(Icons.location_on_outlined),
        ),
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
      context: context,
      bodyBuilder: (context) => DeleteAddressButton(
        addressId: addressModel.id,
      ),
      width: 150,
      height: 60,
    );
  }
}
