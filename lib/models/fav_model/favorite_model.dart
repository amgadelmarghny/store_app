import 'package:store_2/models/shope_models/product_model.dart';

class FavoriteModel {
  final bool status;
  final String message;
  final DataModel dataModel;

  FavoriteModel({
    required this.status,
    required this.message,
    required this.dataModel,
  });
  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
        status: json['status'],
        message: json['message'],
        dataModel: json['data']);
  }
}

class DataModel {
  final int id;
  final ProductModel productModel;

  DataModel({
    required this.id,
    required this.productModel,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(id: json['id'], productModel: json['product']);
  }
}
