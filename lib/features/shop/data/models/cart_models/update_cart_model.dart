import 'package:soagmb/features/shop/data/models/cart_models/cart_item_model.dart';
import 'package:soagmb/features/shop/domain/entities/cart/update_cart.dart';

class UpdateCartModel extends UpdateCart {
  const UpdateCartModel({
    required super.status,
    required super.message,
    required super.data,
  });
  factory UpdateCartModel.fromJson(Map<String, dynamic> json) {
    return UpdateCartModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null
            ? UpdateCartModelData.fromJson(json['data'])
            : null);
  }
}

class UpdateCartModelData extends UpdateCartData {

  
  const UpdateCartModelData(
      {required super.cartItemUpdated,
      required super.subTotal,
      required super.total});
  factory UpdateCartModelData.fromJson(Map<String, dynamic> json) =>
      UpdateCartModelData(
          cartItemUpdated: CartItemModel.fromJson(json['cart']),
          subTotal: json['sub_total'],
          total: json['total']);
}
