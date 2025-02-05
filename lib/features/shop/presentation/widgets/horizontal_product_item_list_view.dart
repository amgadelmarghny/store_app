import 'package:flutter/material.dart';
import 'package:soagmb/core/global/widgets/horizontal_product_item.dart';
import 'package:soagmb/features/shop/domain/entities/cart/cart_item.dart';

class HorizontalProductItemListView extends StatelessWidget {
  const HorizontalProductItemListView({
    super.key,
    required this.cartItemList,
  });

  final List<CartItem> cartItemList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => HorizontalProductItem(
        isCart: true,
        productModel: cartItemList[index].product,
        cartID: cartItemList[index].id,
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemCount: cartItemList.length,
    );
  }
}
