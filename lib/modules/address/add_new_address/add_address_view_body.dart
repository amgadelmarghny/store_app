import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Sourban/modules/address/add_new_address/add_address_button.dart';
import 'package:Sourban/modules/address/add_new_address/add_address_builder.dart';
import 'package:Sourban/shared/bloc/address_cubit/address_cubit.dart';
import 'package:Sourban/shared/components/custom_show_messeges.dart';

class AddAddressViewBody extends StatelessWidget {
  const AddAddressViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController regionController = TextEditingController();
    TextEditingController detailsController = TextEditingController();
    TextEditingController notesController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: BlocConsumer<AddressCubit, AddressState>(
        listener: (context, state) {
          if (state is AddressSuccess) {
            if (state.newAddressModel.status) {
              toastShown(
                  messege: state.newAddressModel.message!,
                  state: ToastState.success,
                  context: context);
            } else {
              toastShown(
                  messege: state.newAddressModel.message!,
                  state: ToastState.error,
                  context: context);
            }
          }
          if (state is AddressFaluir) {
            snacKBar(context, state.error);
          }
        },
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: AddAddressBuilder(
                  nameController: nameController,
                  cityController: cityController,
                  regionController: regionController,
                  detailsController: detailsController,
                  notesController: notesController,
                  formKey: formKey,
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: AddAddressButton(
                  nameContoller: nameController,
                  cityContoller: cityController,
                  regionContoller: regionController,
                  detailsContoller: detailsController,
                  notesContoller: notesController,
                  formKey: formKey,
                  state: state,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
