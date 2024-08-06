import 'package:flutter/material.dart';
import 'package:Sourban/shared/components/address_field.dart';

class AddressView extends StatelessWidget {
  const AddressView({
    super.key,
    required this.nameController,
    required this.cityController,
    required this.regionController,
    required this.detailsController,
    required this.notesController,
  });

  final TextEditingController nameController;
  final TextEditingController cityController;
  final TextEditingController regionController;
  final TextEditingController detailsController;
  final TextEditingController? notesController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AddressField(
              width: 110,
              isOrderView: true,
              textEditingController: nameController,
            ),
            const Spacer(),
            AddressField(
              width: 140,
              isOrderView: true,
              textEditingController: cityController,
            ),
          ],
        ),
        const SizedBox(height: 20),
        AddressField(
          isOrderView: true,
          textEditingController: regionController,
        ),
        const SizedBox(height: 20),
        AddressField(
          isOrderView: true,
          textEditingController: detailsController,
        ),
        if (notesController!.text != '' && notesController?.text != null)
          const SizedBox(height: 20),
        if (notesController!.text != '' && notesController?.text != null)
          AddressField(
            maxLine: 3,
            hintText: 'Note',
            isRequired: false,
            isOrderView: true,
            textEditingController: notesController!,
          ),
      ],
    );
  }
}
