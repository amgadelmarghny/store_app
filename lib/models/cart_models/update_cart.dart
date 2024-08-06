import 'package:soagmb/models/cart_models/get_cart_model.dart';

class UpdateCartModel {
  final bool status;
  final String? message;
  final Data? data;

  UpdateCartModel(
      {required this.status, required this.message, required this.data});
  factory UpdateCartModel.fromJson(Map<String, dynamic> json) {
    return UpdateCartModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? Data.fromJson(json['data']) : null);
  }
}

class Data {
  final CartItem cartItemUpdated;
  final dynamic subTotal;
  final dynamic total;

  Data(
      {required this.cartItemUpdated,
      required this.subTotal,
      required this.total});
  factory Data.fromJson(Map<String, dynamic> json) => Data(
      cartItemUpdated: CartItem.fromJson(json['cart']),
      subTotal: json['sub_total'],
      total: json['total']);
}
