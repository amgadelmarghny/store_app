import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/address/domain/entities/address.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/features/address/presentation/widgets/custom_add_location_map.dart';
import 'package:soagmb/features/address/presentation/widgets/update_addres_button.dart';
import 'package:soagmb/features/address/presentation/widgets/update_address_builder.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';

class UpdateAddressBody extends StatelessWidget {
  const UpdateAddressBody({super.key, required this.addressModel});
  final Address addressModel;
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController regionController = TextEditingController();
    TextEditingController detailsController = TextEditingController();
    TextEditingController notesController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();
    nameController.text = addressModel.name;
    cityController.text = addressModel.city;
    regionController.text = addressModel.region;
    notesController.text = addressModel.notes ?? notesController.text;
    detailsController.text = addressModel.details;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: BlocConsumer<AddressCubit, AddressState>(
        listener: (context, state) {
          if (state is UpdateAddressSuccess) {
            if (state.updateAddressModel.status) {
              toastShown(
                  message: state.updateAddressModel.message,
                  state: ToastState.success,
                  context: context);
              AddressCubit.get(context).locationLatLng = null;
              Navigator.pop(context);
            } else {
              toastShown(
                  message: state.updateAddressModel.message,
                  state: ToastState.error,
                  context: context);
            }
          }
          if (state is AddAddressFailure) {
            toastShown(
                message: state.error,
                state: ToastState.error,
                context: context);
          }
        },
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: UpdateAddressBuilder(
                  nameController: nameController,
                  cityController: cityController,
                  regionController: regionController,
                  detailsController: detailsController,
                  notesController: notesController,
                  formKey: formKey,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 200,
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: CustomAddLocationMap(
                      locationName: nameController.text,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: UpdateAddressButton(
                  nameContoller: nameController,
                  cityContoller: cityController,
                  regionContoller: regionController,
                  detailsContoller: detailsController,
                  notesContoller: notesController,
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
