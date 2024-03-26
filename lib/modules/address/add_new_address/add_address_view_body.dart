import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/modules/address/add_new_address/add_addres_button.dart';
import 'package:store_2/modules/address/add_new_address/add_address_builder.dart';
import 'package:store_2/shared/bloc/address_cubit/address_cubit.dart';
import 'package:store_2/shared/components/custom_show_messeges.dart';

class AddAddressViewBody extends StatelessWidget {
  const AddAddressViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController nameContoller = TextEditingController();
    TextEditingController cityContoller = TextEditingController();
    TextEditingController regionContoller = TextEditingController();
    TextEditingController detailsContoller = TextEditingController();
    TextEditingController notesContoller = TextEditingController();
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
                child: AddAddressButton(
                  nameContoller: nameContoller,
                  cityContoller: cityContoller,
                  regionContoller: regionContoller,
                  detailsContoller: detailsContoller,
                  notesContoller: notesContoller,
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
