import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';
import 'package:soagmb/shared/components/custom_button.dart';
import 'package:soagmb/shared/style/colors.dart';

class UpdateAddressButton extends StatelessWidget {
  const UpdateAddressButton({
    super.key,
    required this.nameContoller,
    required this.cityContoller,
    required this.regionContoller,
    required this.detailsContoller,
    required this.notesContoller,
    required this.formKey,
    required this.state,
    required this.addressId,
  });
  final TextEditingController nameContoller;
  final TextEditingController cityContoller;
  final TextEditingController regionContoller;
  final TextEditingController detailsContoller;
  final TextEditingController notesContoller;
  final GlobalKey<FormState> formKey;
  final AddressState state;
  final int addressId;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomButton(
        isLoading: state is UpdateAddressLoading,
        color: defaultColor,
        text: 'Add new address',
        onTap: () {
          if (formKey.currentState!.validate()) {
            BlocProvider.of<AddressCubit>(context).updateAddress(
              name: nameContoller.text,
              city: cityContoller.text,
              region: regionContoller.text,
              details: detailsContoller.text,
              notes: notesContoller.text,
              addressId: addressId,
            );
          } else {
            BlocProvider.of<AddressCubit>(context).validateObserver();
          }
        },
      ),
    );
  }
}
