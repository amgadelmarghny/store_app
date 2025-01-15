import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';

class AddressesViewHeader extends StatelessWidget {
  const AddressesViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FadeInUp(
        duration: Duration(milliseconds: 500),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total Addresses :'),
            Text(
                '(${BlocProvider.of<AddressCubit>(context).getAddressesModel!.data!.total.toString()})'),
          ],
        ),
      ),
    );
  }
}
