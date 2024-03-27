import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/modules/address/add_new_address/add_address_view.dart';
import 'package:store_2/shared/bloc/address_cubit/address_cubit.dart';
import 'package:store_2/shared/components/custom_buttomt.dart';
import 'package:store_2/shared/style/colors.dart';

class MakeOrderButton extends StatelessWidget {
  const MakeOrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomButton(
          color: defaultColor[600]!,
          text: 'Make Order',
          onTap: () {
            if (BlocProvider.of<AddressCubit>(context)
                .getAddressesModel
                .data!
                .addressModelsList
                .isEmpty) {
              Navigator.pushNamed(context, AddAddressView.id);
            } else {}
          },
        );
      },
    );
  }
}
