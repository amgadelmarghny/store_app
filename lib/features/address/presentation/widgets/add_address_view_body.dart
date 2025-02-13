import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/features/address/presentation/widgets/add_address_button.dart';
import 'package:soagmb/features/address/presentation/widgets/add_address_builder.dart';
import 'package:soagmb/features/address/presentation/widgets/custom_add_location_map.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';
import 'package:soagmb/features/shop/presentation/widgets/navigation.dart';

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

    return FadeInUp(
      duration: Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: BlocConsumer<AddressCubit, AddressState>(
          listener: (context, state) {
            if (state is AddAddressSuccess) {
              if (state.newAddressModel.status) {
                toastShown(
                  message: state.newAddressModel.message!,
                  state: ToastState.success,
                  context: context,
                );
                Navigator.pop(context);
              } else {
                toastShown(
                  message: state.newAddressModel.message!,
                  state: ToastState.error,
                  context: context,
                );
              }
            }
            if (state is AddAddressFailure) {
              toastShown(
                message: state.error,
                state: ToastState.error,
                context: context,
              );
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
                      child: InkWell(
                        onTap: () {
                          navigatorPush(
                            context,
                            CustomAddLocationMap(
                              locationName: nameController.text,
                            ),
                          );
                        },
                        child: CustomAddLocationMap(
                          locationName: nameController.text,
                        ),
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
                  child: AddAddressButton(
                    nameController: nameController,
                    cityController: cityController,
                    regionController: regionController,
                    detailsController: detailsController,
                    notesController: notesController,
                    formKey: formKey,
                    state: state,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
