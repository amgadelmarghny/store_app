import 'package:flutter/material.dart';
import 'payment_method_item.dart';

class PaymentMethodItemListView extends StatefulWidget {
  const PaymentMethodItemListView({super.key});

  @override
  State<PaymentMethodItemListView> createState() =>
      _PaymentMethodItemListViewState();
}

class _PaymentMethodItemListViewState extends State<PaymentMethodItemListView> {
  final List<String> paymentMethodImageList = const [
    'lib/assets/images/visa_credit.svg',
    'lib/assets/images/cash-pickup.svg',
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
