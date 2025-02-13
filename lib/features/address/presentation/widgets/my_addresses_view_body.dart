import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/features/address/presentation/views/add_address_view.dart';
import 'package:soagmb/features/address/presentation/widgets/addresses_item_list_view.dart';
import 'package:soagmb/features/address/presentation/widgets/addresses_view_header.dart';
import 'package:soagmb/features/address/presentation/widgets/empty_address_view_body.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_button.dart';
import 'package:soagmb/core/global/style/colors.dart';

class MyAddressesViewBody extends StatelessWidget {
  const MyAddressesViewBody({
    super.key,
    this.isAddressItemFromDrawerNotOrderSheet = false,
  });
  final bool isAddressItemFromDrawerNotOrderSheet;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        AddressCubit addressCubit = AddressCubit.get(context);
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
                AddressesViewHeader(),
                AddressesItemListView(
                    isFromDrawerNotOrderSheet:
                        isAddressItemFromDrawerNotOrderSheet),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      text: 'Add new address',
                      onTap: () =>
                          Navigator.pushNamed(context, AddAddressView.id),
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
