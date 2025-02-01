import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/features/address/presentation/views/add_address_view.dart';
import 'package:soagmb/features/order/presentation/widgets/order_sheet.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_button.dart';

class MakeOrderButton extends StatelessWidget {
  const MakeOrderButton({
    super.key,
    required this.total,
    required this.productCost,
  });
  final dynamic total;
  final dynamic productCost;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.centerRight,
          children: [
            CustomButton(
              text: 'Make Order',
              onTap: () {
                orderButtonTap(context);
              },
            ),
            if (total != null && total! > productCost)
              Positioned(
                right: 15,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    total.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  void orderButtonTap(BuildContext context) {
    AddressCubit cubit = AddressCubit.get(context);
    if (cubit.getAddressesModel != null &&
        cubit.getAddressesModel!.data!.addressModelsList.isEmpty) {
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
          child: OrderSheet(total: total),
        ),
      );
    }
  }
}
