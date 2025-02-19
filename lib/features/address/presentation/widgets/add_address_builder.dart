import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/features/address/presentation/widgets/address_field.dart';
import 'package:soagmb/generated/l10n.dart';

class AddAddressBuilder extends StatelessWidget {
  const AddAddressBuilder({
    super.key,
    required this.nameController,
    required this.cityController,
    required this.regionController,
    required this.detailsController,
    required this.notesController,
    required this.formKey,
  });
  final TextEditingController nameController;
  final TextEditingController cityController;
  final TextEditingController regionController;
  final TextEditingController detailsController;
  final TextEditingController notesController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: BlocProvider.of<AddressCubit>(context).autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).add_your_address),
          const SizedBox(height: 30),
          Row(
            children: [
              AddressField(
                width: 110,
                label: S.of(context).name,
                hintText: S.of(context).name,
                messageValidationName: S.of(context).name,
                textEditingController: nameController,
              ),
              const Spacer(),
              AddressField(
                width: 120,
                hintText: S.of(context).city,
                label: S.of(context).city,
                messageValidationName: S.of(context).city,
                textEditingController: cityController,
              ),
            ],
          ),
          const SizedBox(height: 20),
          AddressField(
            label: S.of(context).region,
            hintText: S.of(context).region,
            messageValidationName: S.of(context).region,
            textEditingController: regionController,
          ),
          const SizedBox(height: 20),
          AddressField(
            label: S.of(context).details,
            hintText: S.of(context).details,
            messageValidationName: S.of(context).details,
            textEditingController: detailsController,
          ),
          const SizedBox(height: 20),
          AddressField(
            isRequired: false,
            hintText: S.of(context).Notes,
            maxLine: 5,
            messageValidationName: S.of(context).Notes,
            textEditingController: notesController,
            label: S.of(context).Notes,
          ),
        ],
      ),
    );
  }
}
