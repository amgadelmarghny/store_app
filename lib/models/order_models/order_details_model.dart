import 'package:soagmb/models/address_models/address_model.dart';

class OrderDetailsModel {
  bool? status;
  String? message;
  OrderDetailsDataModel? data;

  OrderDetailsModel({this.status, this.message, this.data});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? OrderDetailsDataModel.fromJson(json['data']) : null;
  }
}

class OrderDetailsDataModel {
  int? id;
  dynamic cost;
  dynamic discount;
  dynamic points;
  dynamic vat;
  dynamic total;
  dynamic pointsCommission;
  String? promoCode;
  String? paymentMethod;
  String? date;
  String? status;
  AddressModel? addressModel;
  List<Products>? products;

  OrderDetailsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cost = json['cost'];
    discount = json['discount'];
    points = json['points'];
    vat = json['vat'];
    total = json['total'];
    pointsCommission = json['points_commission'];
    promoCode = json['promo_code'];
    paymentMethod = json['payment_method'];
    date = json['date'];
    status = json['status'];
    addressModel =
        json['address'] != null ? AddressModel.fromJson(json['address']) : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }
}

class Products {
  int? id;
  int? quantity;
  dynamic price;
  String? name;
  String? image;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    name = json['name'];
    image = json['image'];
  }
}
