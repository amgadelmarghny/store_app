import 'package:flutter/material.dart';

class OrderItemView extends StatelessWidget {
  const OrderItemView({super.key});
  static const id = 'OrderItemView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [SliverAppBar(), SliverToBoxAdapter(child: Column())],
      ),
    );
  }
}
