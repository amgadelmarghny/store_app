import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:soagmb/features/address/data/models/address_model.dart';
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
      body: FadeInUp(
        duration: Duration(milliseconds: 300),
        child: UpdateAddressBody(
          addressModel: addressModel,
        ),
      ),
    );
  }
}
