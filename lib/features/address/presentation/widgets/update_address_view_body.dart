import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:soagmb/core/global/views/my_location_map_view.dart';
import 'package:soagmb/features/address/domain/entities/address.dart';
import 'package:soagmb/features/address/domain/entities/place.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/features/address/presentation/widgets/custom_add_location_map.dart';
import 'package:soagmb/features/address/presentation/widgets/update_addres_button.dart';
import 'package:soagmb/features/address/presentation/widgets/update_address_builder.dart';
import 'package:soagmb/core/global/widgets/custom_map_widget.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';

class UpdateAddressBody extends StatelessWidget {
  const UpdateAddressBody(
      {super.key, required this.addressModel, required this.isEditForUpdate});
  final Address addressModel;
  final bool isEditForUpdate;
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
          Place placeModel = Place(
              id: addressModel.id.toString(),
              name: addressModel.name,
              location: LatLng(addressModel.latitude, addressModel.longitude));
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
                  isEditForUpdate: isEditForUpdate,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 15,
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: SizedBox(
                  height: 200,
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: isEditForUpdate
                        ? CustomAddLocationMap(
                            locationName: nameController.text,
                          )
                        : Listener(
                            //for allow tapping on the map
                            onPointerDown: (_) {
                              Navigator.pushNamed(context, MyLocationMapView.id,
                                  arguments: placeModel);
                            },
                            child: CustomMapWidget(placeModel: placeModel),
                          ),
                  ),
                ),
              ),
              if (isEditForUpdate)
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 15,
                  ),
                ),
              if (isEditForUpdate)
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
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 15,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
