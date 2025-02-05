import 'package:soagmb/features/shop/domain/entities/cart/cart_item.dart';
import 'package:soagmb/features/shop/data/models/product_model.dart';

class CartItemModel extends CartItem {
  const CartItemModel({
    required super.id,
    required super.quantity,
    required super.product,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      quantity: json['quantity'],
      product: ProductModel.fromJson(json['product']),
    );
  }
}
