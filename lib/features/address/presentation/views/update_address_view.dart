import 'package:flutter/material.dart';
import 'package:soagmb/models/address_models/address_model.dart';
import 'package:soagmb/features/address/presentation/widgets/update_address_view_body.dart';

class UpdateAddressView extends StatelessWidget {
  const UpdateAddressView({super.key});
  static const String id = "UpdateAddressView";

  @override
  Widget build(BuildContext context) {
    AddressModel addressModel =
        ModalRoute.of(context)!.settings.arguments as AddressModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modify Address'),
      ),
      body: UpdateAddressBody(
        addressModel: addressModel,
      ),
    );
  }
}
