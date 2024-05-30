import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Sourban/shared/bloc/address_cubit/address_cubit.dart';
import 'package:Sourban/shared/components/custom_buttomt.dart';
import 'package:Sourban/shared/style/colors.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({
    super.key,
    required this.nameContoller,
    required this.cityContoller,
    required this.regionContoller,
    required this.detailsContoller,
    required this.notesContoller,
    required this.formKey,
    required this.state,
  });
  final TextEditingController nameContoller;
  final TextEditingController cityContoller;
  final TextEditingController regionContoller;
  final TextEditingController detailsContoller;
  final TextEditingController notesContoller;
  final GlobalKey<FormState> formKey;
  final AddressState state;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomButton(
        isLoading: state is AddressLoading,
        color: defaultColor,
        text: 'Add new address',
        onTap: () {
          if (formKey.currentState!.validate()) {
            BlocProvider.of<AddressCubit>(context)
                .addNewAddress(
                  name: nameContoller.text,
                  city: cityContoller.text,
                  region: regionContoller.text,
                  details: detailsContoller.text,
                  notes: notesContoller.text,
                )
                .then((value) => Navigator.pop(context));
          } else {
            BlocProvider.of<AddressCubit>(context).validateObserver();
          }
        },
      ),
    );
  }
}
