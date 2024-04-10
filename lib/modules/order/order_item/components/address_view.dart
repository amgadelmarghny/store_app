import 'package:flutter/material.dart';
import 'package:store_2/shared/components/address_feild.dart';

class AddressView extends StatelessWidget {
  const AddressView(
      {super.key,
      required this.nameController,
      required this.cityController,
      required this.regionController,
      required this.detailsController,
      required this.notesController});

  final TextEditingController nameController;
  final TextEditingController cityController;
  final TextEditingController regionController;
  final TextEditingController detailsController;
  final TextEditingController notesController;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Add your address'),
      const SizedBox(height: 30),
      Row(
        children: [
          AddressField(
            width: 110,
            isOrderView: true,
            hintText: 'address name',
            messageValidationName: 'Address name',
            textEditingController: nameController,
          ),
          const Spacer(),
          AddressField(
            width: 120,
            isOrderView: true,
            hintText: 'city',
            messageValidationName: 'City',
            textEditingController: cityController,
          ),
        ],
      ),
      const SizedBox(height: 20),
      AddressField(
        hintText: 'region',
        isOrderView: true,
        messageValidationName: 'Region',
        textEditingController: regionController,
      ),
      const SizedBox(height: 20),
      AddressField(
        hintText: 'details',
        isOrderView: true,
        messageValidationName: 'Details',
        textEditingController: detailsController,
      ),
      const SizedBox(height: 20),
      AddressField(
        isRequired: false,
        hintText: 'notes',
        maxLine: 5,
        isOrderView: true,
        messageValidationName: 'Notes',
        textEditingController: notesController,
      ),
    ]);
  }
}
