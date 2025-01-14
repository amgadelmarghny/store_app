import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/style/themes.dart';
import 'package:soagmb/models/address_models/address_model.dart';
import 'package:soagmb/modules/address/get_address/addresses_view.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';

class AddressOptions extends StatelessWidget {
  const AddressOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(builder: (context, state) {
      AddressModel? addressModel =
          BlocProvider.of<AddressCubit>(context).addressModel;
      List addressModelsList = BlocProvider.of<AddressCubit>(context)
          .getAddressesModel!
          .data!
          .addressModelsList;
      return ListTile(
        title: const Text('Address'),
        onTap: () {
          Navigator.of(context).pushNamed(AddressesView.id);
        },
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // this condition added to delete the address name
            // if addresses is empty
            if (addressModelsList.isNotEmpty)
              Text(
                // when there is selected address it name will shown
                addressModel != null
                    ? addressModel.name
                    // if not, first address in addresses will shown
                    : addressModelsList[0].name,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: getResponsiveFontSize(fontSize: 18)),
              ),
            const SizedBox(
              width: 3,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            )
          ],
        ),
      );
    });
  }
}
