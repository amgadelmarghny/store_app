import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/modules/address/add_address_view_body.dart';
import 'package:store_2/shared/bloc/address_cubit/address_cubit.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});
  static const id = '/Add-Address-View';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Address Details'),
        ),
        body: const AddAddressViewBody(),
      ),
    );
  }
}
