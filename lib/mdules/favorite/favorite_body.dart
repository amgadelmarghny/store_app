import 'package:flutter/material.dart';
import 'package:store_2/mdules/favorite/favorite_item.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [FavoriteItem(productModel: ,)]),
    );
  }
}
