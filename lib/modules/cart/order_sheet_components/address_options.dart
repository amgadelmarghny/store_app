import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/modules/address/get_address/addresses_view.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';

class AddressOptions extends StatelessWidget {
  const AddressOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(builder: (context, state) {
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
            if (BlocProvider.of<AddressCubit>(context)
                .getAddressesModel!
                .data!
                .addressModelsList
                .isNotEmpty)
              Text(
                BlocProvider.of<AddressCubit>(context).addressModel != null
                    ? BlocProvider.of<AddressCubit>(context).addressModel!.name
                    : BlocProvider.of<AddressCubit>(context)
                        .getAddressesModel!
                        .data!
                        .addressModelsList[0]
                        .name,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 18),
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
