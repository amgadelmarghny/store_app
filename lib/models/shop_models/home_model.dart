import 'package:Sourban/models/shop_models/product_model.dart';

class HomeModel {
  final bool status;
  final String? message;
  final HomeDataModel? data;

  HomeModel({
    required this.status,
    required this.message,
    required this.data,
  });
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? HomeDataModel.fromJson(json['data']) : null,
    );
  }
}

class HomeDataModel {
  List<BannersHomeModel> bannersList = [];
  List<ProductModel> productsList = [];
  String? ad;

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      bannersList.add(BannersHomeModel.fromJson(element));
    });

    json['products'].forEach((element) {
      productsList.add(ProductModel.fromJson(element));
    });
  }
}

class BannersHomeModel {
  final int id;
  final String image;
  String? category;
  ProductModel? product;

  BannersHomeModel(
      {this.category, this.product, required this.id, required this.image});
  factory BannersHomeModel.fromJson(Map<String, dynamic> json) {
    return BannersHomeModel(
      id: json['id'],
      image: json['image'],
      category: json['category'],
      product: json['product'] != null
          ? ProductModel.fromJson(
              json['product'],
            )
          : null,
    );
  }
}
