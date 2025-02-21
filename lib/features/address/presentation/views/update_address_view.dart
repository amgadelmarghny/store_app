import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soagmb/features/address/data/models/address_model.dart';
import 'package:soagmb/features/address/presentation/widgets/update_address_view_body.dart';
import 'package:soagmb/generated/l10n.dart';

class UpdateAddressView extends StatefulWidget {
  const UpdateAddressView({super.key});
  static const String id = "UpdateAddressView";

  @override
  State<UpdateAddressView> createState() => _UpdateAddressViewState();
}

class _UpdateAddressViewState extends State<UpdateAddressView> {
  bool isEditForUpdate = false;
  @override
  Widget build(BuildContext context) {
    AddressModel addressModel =
        ModalRoute.of(context)!.settings.arguments as AddressModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            isEditForUpdate ? S.of(context).modify_address : addressModel.name),
        actions: isEditForUpdate == false
            ? [
                IconButton(
                  icon: const Icon(CupertinoIcons.check_mark),
                  onPressed: () {
                    setState(() {
                      isEditForUpdate = true;
                    });
                  },
                ),
              ]
            : null,
      ),
      body: FadeInUp(
        duration: Duration(milliseconds: 300),
        child: UpdateAddressBody(
          addressModel: addressModel,
          isEditForUpdate: isEditForUpdate,
        ),
      ),
    );
  }
}
