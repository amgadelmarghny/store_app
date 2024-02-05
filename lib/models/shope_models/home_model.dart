import 'package:store_2/models/shope_models/product_model.dart';

class HomeModel {
  final bool status;
  final String? message;
  final DataHomeModel data;

  HomeModel({
    required this.status,
    required this.message,
    required this.data,
  });
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      status: json['status'],
      message: json['message'],
      data: DataHomeModel.fromJson(json['data']),
    );
  }
}

class DataHomeModel {
  final BannersHomeModel banner;
  final ProductsModel productsModel;
  final String ad;

  DataHomeModel({
    required this.banner,
    required this.productsModel,
    required this.ad,
  });
  factory DataHomeModel.fromJson(Map<String, dynamic> json) => DataHomeModel(
      banner: BannersHomeModel.fromJson(json['banners']),
      productsModel:
          json['products'] ?? ProductsModel.fromJson(json['products']),
      ad: json['ad']);
}

class BannersHomeModel {
  final int id;
  final String image;
  String? category;
  ProductsModel? product;

  BannersHomeModel(
      {this.category, this.product, required this.id, required this.image});
  factory BannersHomeModel.fromJson(dynamic json) {
    return BannersHomeModel(
      id: json['id'],
      image: json['image'],
      category: json['category'],
      product: json['product'] ??
          ProductsModel.fromJson(
            json['product'],
          ),
    );
  }
}
