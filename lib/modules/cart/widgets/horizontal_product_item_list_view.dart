import 'package:flutter/material.dart';
import 'package:soagmb/modules/favorite/widgets/horizontal_product_item.dart';

class HorizontalProductItemListView extends StatelessWidget {
  const HorizontalProductItemListView({
    super.key,
    required this.cartItemList,
  });

  final List cartItemList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => HorizontalProductItem(
        isCart: true,
        productModel: cartItemList[index].productModel,
        cartID: cartItemList[index].id,
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemCount: cartItemList.length,
    );
  }
}
