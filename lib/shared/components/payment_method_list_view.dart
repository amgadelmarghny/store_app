import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';
import 'payment_method_item.dart';

class PaymentMethodItemListView extends StatelessWidget {
  const PaymentMethodItemListView({super.key});

  final List<String> paymentMethodImageList = const [
    'lib/assets/images/cash-pickup.svg',
    'lib/assets/images/visa_credit.svg',
    'lib/assets/images/paypal.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        return SizedBox(
          height: 62,
          width: MediaQuery.sizeOf(context).width,
          child: ListView.builder(
            clipBehavior: Clip.antiAlias,
            itemCount: paymentMethodImageList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<AddressCubit>(context)
                        .setSelectedValue(index);
                  },
                  child: PaymentMethodItem(
                    isActive: BlocProvider.of<AddressCubit>(context).isChoose ==
                        index,
                    image: paymentMethodImageList[index],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
