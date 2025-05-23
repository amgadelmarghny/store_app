import 'package:flutter/material.dart';
import 'package:soagmb/core/global/widgets/custom_refresh_page.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/features/address/presentation/widgets/my_addresses_view_body.dart';
import 'package:soagmb/generated/l10n.dart';

class MyAddressesView extends StatelessWidget {
  const MyAddressesView({super.key});
  static const id = 'AddressesView';
  @override
  Widget build(BuildContext context) {
    bool isFromDrawerNotOrderSheet =
        ModalRoute.of(context)?.settings.arguments as bool? ?? false;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).my_addresses),
      ),
      body: CustomRefreshPage(
        onRefresh: () async => await AddressCubit.get(context).getAddresses(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: MyAddressesViewBody(
            isAddressItemFromDrawerNotOrderSheet: isFromDrawerNotOrderSheet,
          ),
        ),
      ),
    );
  }
}
