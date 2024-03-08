import 'package:store_2/models/shope_models/product_model.dart';

class GetCartModel {
  final bool status;
  final String? message;
  final Data? data;

  GetCartModel({
    required this.status,
    required this.message,
    required this.data,
  });
  factory GetCartModel.fromJson(Map<String, dynamic> json) {
    return GetCartModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : json['data'],
    );
  }
}

class Data {
  List cartItems = [];
  Data.fromJson(Map<String, dynamic> json) {
    for (var element in ['cart_items']) {
      cartItems.add(ProductModel.fromJson(element));
    }
  }
}

class CartItem {
  final int id;
  final int quantity;
  final ProductModel product;

  CartItem({
    required this.id,
    required this.quantity,
    required this.product,
  });
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      quantity: json['quantity'],
      product: ProductModel.fromJson('product'),
    );
  }
}
