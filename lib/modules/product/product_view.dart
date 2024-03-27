import 'package:flutter/material.dart';
import 'package:store_2/modules/product/product_view_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});
  static const String id = '/product-view';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argumentMap =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
        child: ProductViewBody(
          productModel: argumentMap['productModel'],
          fromCart: argumentMap['isCart'] ?? false,
          isSearch: argumentMap['isSearch'] ?? false,
          cartID: argumentMap['cartID'] ?? 1,
        ),
      ),
    );
  }
}
