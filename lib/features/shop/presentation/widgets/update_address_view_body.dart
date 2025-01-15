import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/models/address_models/address_model.dart';
import 'package:soagmb/features/shop/presentation/widgets/update_addres_button.dart';
import 'package:soagmb/features/shop/presentation/widgets/update_address_builder.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';

class UpdateAddressBody extends StatelessWidget {
  const UpdateAddressBody({super.key, required this.addressModel});
  final AddressModel addressModel;
  @override
  Widget build(BuildContext context) {
    TextEditingController nameContoller = TextEditingController();
    TextEditingController cityContoller = TextEditingController();
    TextEditingController regionContoller = TextEditingController();
    TextEditingController detailsContoller = TextEditingController();
    TextEditingController? notesContoller = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();
    nameContoller.text = addressModel.name;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: BlocConsumer<AddressCubit, AddressState>(
        listener: (context, state) {
          if (state is UpdateAddressSuccess) {
            if (state.updateAddressModel.status!) {
              Navigator.pop(context);
              Navigator.pop(context);
              toastShown(
                  message: state.updateAddressModel.message!,
                  state: ToastState.success,
                  context: context);
            } else {
              toastShown(
                  message: state.updateAddressModel.message!,
                  state: ToastState.error,
                  context: context);
            }
          }
          if (state is AddAddressFailure) {
            snacKBar(context, state.error);
          }
        },
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: UpdateAddressBuilder(
                  nameContoller: nameContoller,
                  cityContoller: cityContoller,
                  regionContoller: regionContoller,
                  detailsContoller: detailsContoller,
                  notesContoller: notesContoller,
                  formKey: formKey,
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: UpdateAddressButton(
                  nameContoller: nameContoller,
                  cityContoller: cityContoller,
                  regionContoller: regionContoller,
                  detailsContoller: detailsContoller,
                  notesContoller: notesContoller,
                  formKey: formKey,
                  state: state,
                  addressId: addressModel.id,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
