import 'package:flutter/material.dart';
import 'package:soagmb/features/order/domain/entities/order_details.dart';
import 'package:soagmb/features/order/presentation/widgets/order_product_items_list_view.dart';
import 'package:soagmb/features/order/presentation/widgets/order_item_address_section.dart';
import 'package:soagmb/features/order/presentation/widgets/cancelation_order_button.dart';
import 'package:soagmb/features/shop/presentation/widgets/product_coast.dart';
import 'package:soagmb/features/shop/presentation/widgets/total_coast.dart';

class OrderItemViewBody extends StatelessWidget {
  const OrderItemViewBody({
    super.key, required this.orderDetailsData,
  
  });
  final OrderDetailsData orderDetailsData;

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
      child: Transform.translate(
        offset: const Offset(0, -15),
        child: ListView(
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CancelationOrderButton(
                  orderId:orderDetailsData. id!,
                ),
                const SizedBox(
                  width: 30,
                )
              ],
            ),
            const Text('Products'),
            const SizedBox(height: 15),
            OrderProductItemsListView(productModelList:orderDetailsData.products!),
            SizedBox(
              height: 20,
            ),
            if (orderDetailsData.discount > 0)
              ProductCoast(
                title: 'Discount',
                number: orderDetailsData.discount,
              ),
            ProductCoast(
              title: 'Coast',
              number: orderDetailsData.cost,
            ),
            ProductCoast(
              title: 'Vat',
              number: orderDetailsData.vat.round(),
            ),
            const Divider(
              thickness: 1,
              endIndent: 60,
              indent: 60,
            ),
            TotalCoast(
              number: orderDetailsData.total.round(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Address'),
            const SizedBox(
              height: 20,
            ),
            OrderItemAddressSection(addressModel: orderDetailsData.addressModel,

            )
          ],
        ),
      ),
    );
  }
}
