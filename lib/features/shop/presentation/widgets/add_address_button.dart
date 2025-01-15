import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_button.dart';
import 'package:soagmb/core/global/style/colors.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({
    super.key,
    required this.nameController,
    required this.cityController,
    required this.regionController,
    required this.detailsController,
    required this.notesController,
    required this.formKey,
    required this.state,
  });
  final TextEditingController nameController;
  final TextEditingController cityController;
  final TextEditingController regionController;
  final TextEditingController detailsController;
  final TextEditingController notesController;
  final GlobalKey<FormState> formKey;
  final AddressState state;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomButton(
        isLoading: state is AddAddressLoading,
        color: defaultColor,
        text: 'Add new address',
        onTap: () {
          if (formKey.currentState!.validate()) {
            BlocProvider.of<AddressCubit>(context).addNewAddress(
              name: nameController.text,
              city: cityController.text,
              region: regionController.text,
              details: detailsController.text,
              notes: notesController.text,
            );
          } else {
            BlocProvider.of<AddressCubit>(context).validateObserver();
          }
        },
      ),
    );
  }
}
