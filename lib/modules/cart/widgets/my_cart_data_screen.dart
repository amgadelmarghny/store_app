import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/modules/cart/make_order_button.dart';
import 'package:soagmb/modules/cart/widgets/horizontal_product_item_list_view.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';

class MyCartDataScreen extends StatelessWidget {
  const MyCartDataScreen({
    super.key,
    required this.cartItemList,
  });

  final List cartItemList;

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
            total: BlocProvider.of<ShopCubit>(context)
                .cartModel!
                .data!
                .total!
                .toInt(),
            productCost: cartItemList[0].productModel.price,
          ),
        ),
      ],
    );
  }
}
