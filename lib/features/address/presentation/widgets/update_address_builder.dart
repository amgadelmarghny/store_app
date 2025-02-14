import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/features/address/presentation/widgets/address_field.dart';

class UpdateAddressBuilder extends StatelessWidget {
  const UpdateAddressBuilder({
    super.key,
    required this.nameController,
    required this.cityController,
    required this.regionController,
    required this.detailsController,
    required this.notesController,
    required this.formKey,
    required this.isEditForUpdate,
  });
  final TextEditingController nameController;
  final TextEditingController cityController;
  final TextEditingController regionController;
  final TextEditingController detailsController;
  final TextEditingController notesController;
  final GlobalKey<FormState> formKey;
  final bool isEditForUpdate;
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 300),
      child: Form(
        key: formKey,
        autovalidateMode:
            BlocProvider.of<AddressCubit>(context).autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Add your address'),
            const SizedBox(height: 30),
            Row(
              children: [
                AddressField(
                  width: 110,
                  hintText: 'address name',
                  messageValidationName: 'Address name',
                  textEditingController: nameController,
                  readOnly: !isEditForUpdate,
                  isRequired: isEditForUpdate,
                  label: 'name',
                ),
                const Spacer(),
                AddressField(
                  label: 'city',
                  width: 120,
                  hintText: 'city',
                  messageValidationName: 'City',
                  textEditingController: cityController,
                  readOnly: !isEditForUpdate,
                  isRequired: isEditForUpdate,
                ),
              ],
            ),
            const SizedBox(height: 20),
            AddressField(
              label: 'region',
              hintText: 'region',
              messageValidationName: 'Region',
              textEditingController: regionController,
              readOnly: !isEditForUpdate,
              isRequired: isEditForUpdate,
            ),
            const SizedBox(height: 20),
            AddressField(
              label: 'details',
              hintText: 'details',
              messageValidationName: 'Details',
              textEditingController: detailsController,
              readOnly: !isEditForUpdate,
              isRequired: isEditForUpdate,
            ),
            const SizedBox(height: 20),
            if (isEditForUpdate || notesController.text.isNotEmpty)
              AddressField(
                label: 'notes',
                isRequired: false,
                hintText: 'notes',
                maxLine: 5,
                messageValidationName: 'Notes',
                textEditingController: notesController,
                readOnly: !isEditForUpdate,
              ),
          ],
        ),
      ),
    );
  }
}
