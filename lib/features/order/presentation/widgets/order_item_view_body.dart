import 'package:flutter/material.dart';
import 'package:soagmb/features/order/domain/entities/products_order.dart';
import 'package:soagmb/features/order/presentation/widgets/order_product_items_list_view.dart';
import 'package:soagmb/features/order/presentation/widgets/order_item_address_section.dart';
import 'package:soagmb/features/order/presentation/widgets/cancelation__order_button.dart';
import 'package:soagmb/features/shop/presentation/widgets/product_coast.dart';
import 'package:soagmb/features/shop/presentation/widgets/total_coast.dart';
import 'package:soagmb/features/shop/presentation/widgets/container_decoration.dart';

class OrderItemViewBody extends StatelessWidget {
  const OrderItemViewBody({
    super.key,
    required this.productModelList,
    required this.name,
    required this.city,
    required this.details,
    required this.region,
    required this.note,
    required this.discount,
    required this.coast,
    required this.vat,
    required this.total,
    required this.orderId,
  });
  final List<ProductsOrder> productModelList;
  final int orderId;
  final String name;
  final String city;
  final dynamic details;
  final String region;
  final String? note;
  final dynamic discount;
  final dynamic coast;
  final dynamic vat;
  final dynamic total;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController regionController = TextEditingController();
    TextEditingController detailsController = TextEditingController();
    TextEditingController notesController = TextEditingController();
    nameController.text = name;
    cityController.text = city;
    regionController.text = region;
    detailsController.text = details;
    if (note != null) {
      notesController.text = note!;
    }

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
                  orderId: orderId,
                ),
                const SizedBox(
                  width: 30,
                )
              ],
            ),
            const Text('Products'),
            const SizedBox(height: 15),
            OrderProductItemsListView(productModelList: productModelList),
            SizedBox(
              height: 20,
            ),
            if (discount > 0)
              ProductCoast(
                title: 'Discount',
                number: discount,
              ),
            ProductCoast(
              title: 'Coast',
              number: coast,
            ),
            ProductCoast(
              title: 'Vat',
              number: vat.round(),
            ),
            const Divider(
              thickness: 1,
              endIndent: 60,
              indent: 60,
            ),
            TotalCoast(
              number: total.round(),
            ),
            SizedBox(
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
              child: OrderItemAddressSection(
                nameController: nameController,
                cityController: cityController,
                regionController: regionController,
                detailsController: detailsController,
                notesController: notesController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
