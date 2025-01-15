import 'package:flutter/material.dart';
import 'package:soagmb/core/global/widgets/horizontal_product_item.dart';
import 'package:soagmb/models/shop_models/product_model.dart';

class SearchDataScreen extends StatelessWidget {
  const SearchDataScreen({
    super.key,
    required this.productsList,
  });
  final List<ProductModel> productsList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return HorizontalProductItem(
            isSearch: true,
            productModel: productsList[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: productsList.length,
      ),
    );
  }
}
