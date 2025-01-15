import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/address_field.dart';

class UpdateAddressBuilder extends StatelessWidget {
  const UpdateAddressBuilder({
    super.key,
    required this.nameContoller,
    required this.cityContoller,
    required this.regionContoller,
    required this.detailsContoller,
    required this.notesContoller,
    required this.formKey,
  });
  final TextEditingController nameContoller;
  final TextEditingController cityContoller;
  final TextEditingController regionContoller;
  final TextEditingController detailsContoller;
  final TextEditingController notesContoller;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: BlocProvider.of<AddressCubit>(context).autovalidateMode,
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
                textEditingController: nameContoller,
              ),
              const Spacer(),
              AddressField(
                width: 120,
                hintText: 'city',
                messageValidationName: 'City',
                textEditingController: cityContoller,
              ),
            ],
          ),
          const SizedBox(height: 20),
          AddressField(
            hintText: 'region',
            messageValidationName: 'Region',
            textEditingController: regionContoller,
          ),
          const SizedBox(height: 20),
          AddressField(
            hintText: 'details',
            messageValidationName: 'Details',
            textEditingController: detailsContoller,
          ),
          const SizedBox(height: 20),
          AddressField(
            isRequired: false,
            hintText: 'notes',
            maxLine: 5,
            messageValidationName: 'Notes',
            textEditingController: notesContoller,
          ),
        ],
      ),
    );
  }
}
