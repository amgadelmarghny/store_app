import 'package:flutter/material.dart';
import 'package:store_2/mdules/cart/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});
  static const String id = 'my_cart_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: MyCartViewBody(),
      ),
    );
  }
}
