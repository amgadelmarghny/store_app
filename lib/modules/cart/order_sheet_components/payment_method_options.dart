import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/shared/bloc/address_cubit/address_cubit.dart';

class PaymantMethodOptions extends StatelessWidget {
  const PaymantMethodOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      onSelected: (value) {
        BlocProvider.of<AddressCubit>(context).setSelectedValue(value);
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 1,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width / 1.5,
              child: const Center(
                child: Text(
                  'Cash',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          const PopupMenuItem(
            value: 2,
            child: SizedBox(
              child: Center(
                child: Text(
                  'Card',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ];
      },
      child: ListTile(
        title: const Text('Payment method'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<AddressCubit, AddressState>(
              builder: (context, state) {
                return Text(
                  BlocProvider.of<AddressCubit>(context).selectedType,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 18),
                );
              },
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
