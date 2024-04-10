import 'package:flutter/material.dart';
import 'package:store_2/modules/order/order_item/components/product_coast.dart';
import 'package:store_2/modules/order/order_item/components/total_coast.dart';
import 'package:store_2/modules/order/order_item/order_product_item.dart';
import 'package:store_2/shared/components/container_decoration.dart';

class OrderItemViewBody extends StatelessWidget {
  const OrderItemViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
      child: ListView(
        primary: false,
        shrinkWrap: true,
        children: [
          const Text('Products'),
          const SizedBox(height: 15),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const OrderProductItem();
              },
              separatorBuilder: (context, index) => const SizedBox(height: 18),
              itemCount: 2),
          const Divider(
            thickness: 1.5,
            height: 50,
          ),
          const ProductCoast(
            title: 'Discount',
          ),
          const ProductCoast(
            title: 'Coast',
          ),
          const ProductCoast(
            title: 'Vat',
          ),
          const Divider(
            thickness: 1.5,
            endIndent: 60,
            indent: 60,
          ),
          const TotalCoast(),
          const Divider(
            thickness: 1.5,
            height: 20,
          ),
          const SizedBox(
            height: 8,
          ),
          const Text('Address'),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: decorationBuilder(context),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
