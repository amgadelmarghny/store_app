import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/generated/l10n.dart';

class AddressesViewHeader extends StatelessWidget {
  const AddressesViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FadeInUp(
        duration: Duration(milliseconds: 300),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.of(context).total_addresses),
            Text(
                '(${BlocProvider.of<AddressCubit>(context).getAddressesModel!.data!.total.toString()})'),
          ],
        ),
      ),
    );
  }
}
