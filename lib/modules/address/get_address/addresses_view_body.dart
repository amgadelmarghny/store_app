import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:Sourban/modules/address/add_new_address/add_address_view.dart';
import 'package:Sourban/modules/address/get_address/address_item.dart';
import 'package:Sourban/modules/address/get_address/empty_address_view_body.dart';
import 'package:Sourban/shared/bloc/address_cubit/address_cubit.dart';
import 'package:Sourban/shared/components/custom_show_messages.dart';
import 'package:Sourban/shared/style/colors.dart';

class AddressesViewBody extends StatelessWidget {
  const AddressesViewBody({
    super.key,
    this.isformDrowerNotOrderSheet = false,
  });
  final bool? isformDrowerNotOrderSheet;
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
            builder: (context) => SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  MaterialButton(
                    color: defaultColor.shade100,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AddAddressView.id);
                    },
                    child: const Text(
                      'Add New Address',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      const Text('Total Addresses :'),
                      const Spacer(),
                      Text(
                          '(${BlocProvider.of<AddressCubit>(context).getAddressesModel!.data!.total.toString()})'),
                      const SizedBox(width: 20),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (contex, index) {
                      return AddressItem(
                          isFromDrawerNotOrderSheet: isformDrowerNotOrderSheet,
                          addressModel: addressCubit.getAddressesModel!.data!
                              .addressModelsList[index]);
                    },
                    separatorBuilder: (context, index) => const Divider(
                      endIndent: 20,
                      indent: 20,
                    ),
                    itemCount: addressCubit
                        .getAddressesModel!.data!.addressModelsList.length,
                  )
                ],
              ),
            ),
            fallback: (context) => const Center(
                child: CircularProgressIndicator(color: defaultColor)),
          ),
        );
      },
    );
  }
}
