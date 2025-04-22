import 'package:flutter/material.dart';
import 'package:soagmb/features/address/data/models/add_new_address_parameter.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/core/global/widgets/custom_button.dart';
import 'package:soagmb/core/global/style/colors.dart';
import 'package:soagmb/generated/l10n.dart';

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
        text: S.of(context).add_new_address,
        onTap: () {
          AddressCubit cubit = AddressCubit.get(context);
          if (formKey.currentState!.validate()) {
            AddNewAddressParameter parameter = AddNewAddressParameter(
                name: nameController.text,
                city: cityController.text,
                region: regionController.text,
                details: detailsController.text,
                notes: notesController.text,
                latitude: cubit.locationLatLng?.latitude.toString(),
                longitude: cubit.locationLatLng?.longitude.toString());
            cubit.addNewAddress(parameter: parameter);
          } else {
            cubit.validateObserver();
          }
        },
      ),
    );
  }
}
