import 'package:flutter/material.dart';
import 'package:store_2/modules/order/order_item/order_product_item.dart';

class OrderItemViewBody extends StatelessWidget {
  const OrderItemViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
      child: ListView(
        primary: false,
        shrinkWrap: true,
        children: [
          const Text('Products'),
          const SizedBox(
            height: 15,
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const OrderProductItem();
              },
              separatorBuilder: (context, index) => const SizedBox(height: 18),
              itemCount: 2),
        ],
      ),
    );
  }
}
