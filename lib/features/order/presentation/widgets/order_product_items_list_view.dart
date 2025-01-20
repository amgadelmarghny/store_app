import 'package:flutter/material.dart';
import 'package:soagmb/features/order/presentation/widgets/order_product_item.dart';
import 'package:soagmb/models/order_models/order_details_model.dart';

class OrderProductItemsListView extends StatelessWidget {
  const OrderProductItemsListView({
    super.key,
    required this.productModelList,
  });

  final List<Products> productModelList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return OrderProductItem(
          productModel: productModelList[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 18),
      itemCount: productModelList.length,
    );
  }
}