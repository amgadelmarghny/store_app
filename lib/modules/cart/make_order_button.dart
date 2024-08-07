import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/modules/address/add_new_address/add_address_view.dart';
import 'package:soagmb/modules/cart/order_sheet.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';
import 'package:soagmb/shared/components/custom_button.dart';

class MakeOrderButton extends StatelessWidget {
  const MakeOrderButton({
    super.key,
    required this.total,
    required this.productCoast,
  });
  final dynamic total;
  final dynamic productCoast;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          children: [
            CustomButton(
              text: 'Make Order',
              onTap: () {
                if (BlocProvider.of<AddressCubit>(context).getAddressesModel !=
                        null &&
                    BlocProvider.of<AddressCubit>(context)
                        .getAddressesModel!
                        .data!
                        .addressModelsList
                        .isEmpty) {
                  Navigator.pushNamed(context, AddAddressView.id);
                } else {
                  showModalBottomSheet(
                    clipBehavior: Clip.hardEdge,
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(20),
                      child: OrderSheet(
                        total: total,
                      ),
                    ),
                  );
                }
              },
            ),
            if (total != null)
              if (total! > productCoast)
                Positioned(
                  top: 55 / 4,
                  right: 15,
                  child: Container(
                    color: Colors.amber,
                    padding: const EdgeInsets.all(2),
                    child: Text(
                      total.toString(),
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                )
          ],
        );
      },
    );
  }
}
