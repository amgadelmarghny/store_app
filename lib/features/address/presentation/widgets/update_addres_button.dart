import 'package:flutter/material.dart';
import 'package:soagmb/features/address/data/models/update_address_parameter.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_button.dart';
import 'package:soagmb/core/global/style/colors.dart';

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
    AddressCubit cubit = AddressCubit.get(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomButton(
        isLoading: state is UpdateAddressLoading,
        color: defaultColor,
        text: 'Update my address',
        onTap: () {
          if (formKey.currentState!.validate()) {
            UpdateAddressParameter parameter = UpdateAddressParameter(
                name: nameContoller.text,
                city: cityContoller.text,
                region: regionContoller.text,
                details: detailsContoller.text,
                notes: notesContoller.text,
                addressId: addressId,
                latitude: cubit.locationLatLng?.latitude.toString(),
                longitude: cubit.locationLatLng?.longitude.toString());
            cubit.updateAddress(parameter: parameter);
          } else {
            cubit.validateObserver();
          }
        },
      ),
    );
  }
}
