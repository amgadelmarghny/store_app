import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/shared/bloc/address_cubit/address_cubit.dart';
import 'payment_method_item.dart';

class PaymentMethodItemListView extends StatefulWidget {
  const PaymentMethodItemListView({super.key});

  @override
  State<PaymentMethodItemListView> createState() =>
      _PaymentMethodItemListViewState();
}

class _PaymentMethodItemListViewState extends State<PaymentMethodItemListView> {
  final List<String> paymentMethodImageList = const [
    'lib/assets/images/cash-pickup.svg',
    'lib/assets/images/visa_credit.svg',
  ];

  int isChoose = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      width: 500,
      child: ListView.builder(
        clipBehavior: Clip.none,
        itemCount: paymentMethodImageList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () {
                isChoose = index;
                setState(() {});
                BlocProvider.of<AddressCubit>(context)
                    .setSelectedValue(isChoose + 1);
              },
              child: PaymentMethodItem(
                isActive: isChoose == index,
                image: paymentMethodImageList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
