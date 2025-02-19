import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/features/address/presentation/widgets/address_field.dart';
import 'package:soagmb/generated/l10n.dart';

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
            Text(S.of(context).add_your_address),
            const SizedBox(height: 30),
            Row(
              children: [
                AddressField(
                  width: 110,
                  hintText: S.of(context).name,
                  messageValidationName: S.of(context).name,
                  textEditingController: nameController,
                  readOnly: !isEditForUpdate,
                  isRequired: isEditForUpdate,
                  label: S.of(context).name,
                ),
                const Spacer(),
                AddressField(
                  label: S.of(context).city,
                  width: 120,
                  hintText: S.of(context).city,
                  messageValidationName: S.of(context).city,
                  textEditingController: cityController,
                  readOnly: !isEditForUpdate,
                  isRequired: isEditForUpdate,
                ),
              ],
            ),
            const SizedBox(height: 20),
            AddressField(
              label: S.of(context).region,
              hintText: S.of(context).region,
              messageValidationName: S.of(context).region,
              textEditingController: regionController,
              readOnly: !isEditForUpdate,
              isRequired: isEditForUpdate,
            ),
            const SizedBox(height: 20),
            AddressField(
              label: S.of(context).details,
              hintText: S.of(context).details,
              messageValidationName: S.of(context).details,
              textEditingController: detailsController,
              readOnly: !isEditForUpdate,
              isRequired: isEditForUpdate,
            ),
            const SizedBox(height: 20),
            if (isEditForUpdate || notesController.text.isNotEmpty)
              AddressField(
                label: S.of(context).Notes,
                isRequired: false,
                hintText: S.of(context).Notes,
                maxLine: 5,
                messageValidationName: S.of(context).Notes,
                textEditingController: notesController,
                readOnly: !isEditForUpdate,
              ),
          ],
        ),
      ),
    );
  }
}
