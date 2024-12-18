import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:soagmb/modules/address/add_new_address/add_address_view.dart';
import 'package:soagmb/modules/address/get_address/addresses_item_list_view.dart';
import 'package:soagmb/modules/address/get_address/adressess_view_header.dart';
import 'package:soagmb/modules/address/get_address/empty_address_view_body.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';
import 'package:soagmb/shared/components/custom_button.dart';
import 'package:soagmb/shared/components/custom_show_messages.dart';
import 'package:soagmb/shared/style/colors.dart';

class AddressesViewBody extends StatelessWidget {
  const AddressesViewBody({
    super.key,
    this.isFromDrawerNotOrderSheet = false,
  });
  final bool isFromDrawerNotOrderSheet;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state is DeleteAddressSuccess) {
          if (BlocProvider.of<AddressCubit>(context)
              .deleteAddressModel
              .status!) {
            toastShown(
                message: BlocProvider.of<AddressCubit>(context)
                    .deleteAddressModel
                    .message!,
                state: ToastState.success,
                context: context);
          }
        }
      },
      builder: (context, state) {
        AddressCubit addressCubit = BlocProvider.of<AddressCubit>(context);
        if (addressCubit.getAddressesModel != null &&
            addressCubit.getAddressesModel!.data!.addressModelsList.isEmpty) {
          return const EmptyAddressViewBody();
        }
        return ModalProgressHUD(
          inAsyncCall: state is DeleteAddressLoading,
          child: ConditionalBuilder(
            condition: addressCubit.getAddressesModel != null &&
                addressCubit
                    .getAddressesModel!.data!.addressModelsList.isNotEmpty,
            builder: (context) => CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: AdressessViewHeader()),
                SliverToBoxAdapter(child: const SizedBox(height: 20)),
                AddressessItemListView(
                    isFromDrawerNotOrderSheet: isFromDrawerNotOrderSheet),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomButton(
                        text: 'Add new address',
                        onTap: () =>
                            Navigator.pushNamed(context, AddAddressView.id),
                      ),
                    ),
                  ),
                )
              ],
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(color: defaultColor),
            ),
          ),
        );
      },
    );
  }
}
