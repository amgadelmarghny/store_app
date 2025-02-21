import 'product_item_order.dart';

class ProductItemsListModel {
  final List<ProductItemOrder> items;

  ProductItemsListModel({required this.items});

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}
