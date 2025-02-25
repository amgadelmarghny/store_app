import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/domain/entities/cart/cart_item.dart';
import 'package:soagmb/features/shop/presentation/widgets/make_order_button.dart';
import 'package:soagmb/features/shop/presentation/widgets/horizontal_product_item_list_view.dart';

class MyCartDataScreen extends StatelessWidget {
  const MyCartDataScreen({
    super.key,
    required this.cartItemList,
  });

  final List<CartItem> cartItemList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: HorizontalProductItemListView(cartItemList: cartItemList),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: MakeOrderButton(
            productCost: cartItemList[0].product.price,
          ),
        ),
      ],
    );
  }
}
