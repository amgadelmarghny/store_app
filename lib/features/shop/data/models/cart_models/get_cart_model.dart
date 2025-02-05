import 'package:soagmb/features/shop/data/models/cart_models/cart_item_model.dart';
import 'package:soagmb/features/shop/domain/entities/cart/get_cart.dart';

class GetCartModel extends GetCart {
  const GetCartModel({
    required super.status,
    required super.message,
    required super.data,
  });
  
  factory GetCartModel.fromJson(Map<String, dynamic> json) {
    return GetCartModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? GetCartModelData.fromJson(json['data'])
          : json['data'],
    );
  }
}

class GetCartModelData extends GetCartData {
  const GetCartModelData({
    required super.total,
    required super.cartItemsList,
  });

  factory GetCartModelData.fromJson(Map<String, dynamic> json) {
    return GetCartModelData(
      total: json['total'],
      cartItemsList: List<CartItemModel>.from(
        json['cart_items'].map((e) => CartItemModel.fromJson(e)),
      ),
    );
  }
}
