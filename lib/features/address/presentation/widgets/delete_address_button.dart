import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';
import 'package:soagmb/generated/l10n.dart';

class DeleteAddressButton extends StatelessWidget {
  const DeleteAddressButton({super.key, required this.addressId});
  final int addressId;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state is DeleteAddressFailure) {
          toastShown(
            message: state.error,
            state: ToastState.error,
            context: context,
          );
        }
      },
      child: MaterialButton(
        onPressed: () {
          BlocProvider.of<AddressCubit>(context)
              .deleteAddress(addressId: addressId)
              .then((value) {
            if (context.mounted) Navigator.pop(context);
          });
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
             Text(
              S.of(context).delete,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
