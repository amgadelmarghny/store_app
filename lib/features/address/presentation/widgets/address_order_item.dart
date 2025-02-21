import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:soagmb/features/address/domain/entities/address.dart';
import 'package:soagmb/features/address/presentation/widgets/address_order_item_leading.dart';

class AddressOrderItem extends StatelessWidget {
  const AddressOrderItem({
    super.key,
    required this.addressModel,
    required this.isActive,
    required this.onChanged,
  });

  final Address addressModel;
  final bool isActive;
  final void Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 300),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 5),
        leading: AddressOrderItemLeading(
          isActive: isActive,
          onChanged: onChanged,
        ),
        title: Text(addressModel.name),
        subtitle: Text('${addressModel.city}, ${addressModel.region}'),
      ),
    );
  }
}
