import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/style/themes.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'payment_method_list_view.dart';

class PaymentMethodOptions extends StatelessWidget {
  const PaymentMethodOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actionsPadding: const EdgeInsets.only(bottom: 16, right: 20),
            content: const PaymentMethodItemListView(),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Ok',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: getResponsiveFontSize(fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      title: const Text('Payment method'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocConsumer<AddressCubit, AddressState>(
            builder: (context, state) {
              return FittedBox(
                child: Text(
                  BlocProvider.of<AddressCubit>(context).selectedTypeName,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: getResponsiveFontSize(fontSize: 18)),
                ),
              );
            },
            listener: (BuildContext context, state) {},
          ),
          const SizedBox(
            width: 3,
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 18,
          ),
        ],
      ),
    );
  }
}
