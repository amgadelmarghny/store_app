import 'package:soagmb/features/order/domain/entities/products_order.dart';

class ProductsOrderModel extends ProductsOrder {
  const ProductsOrderModel({
    required super.id,
    required super.quantity,
    required super.price,
    required super.name,
    required super.image,
  });

  factory ProductsOrderModel.fromJson(Map<String, dynamic> json) =>
      ProductsOrderModel(
        id: json['id'],
        quantity: json['quantity'],
        price: json['price'],
        name: json['name'],
        image: json['image'],
      );
}
