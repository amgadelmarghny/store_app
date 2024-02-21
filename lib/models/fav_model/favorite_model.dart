import 'package:store_2/models/shope_models/product_model.dart';

class ChangedFavoriteModel {
  final bool status;
  final String message;
  final FavDataModel? dataModel;

  ChangedFavoriteModel({
    required this.status,
    required this.message,
    required this.dataModel,
  });
  factory ChangedFavoriteModel.fromJson(Map<String, dynamic> json) {
    return ChangedFavoriteModel(
        status: json['status'],
        message: json['message'],
        dataModel: json['data'] != null
            ? FavDataModel.fromJson(json['data'])
            : json['data']);
  }
}

class FavDataModel {
  final int id;
  final ProductModel? productModel;

  FavDataModel({
    required this.id,
    required this.productModel,
  });
  factory FavDataModel.fromJson(Map<String, dynamic> json) {
    return FavDataModel(
      id: json['id'],
      productModel: json['product'] != null
          ? ProductModel.fromJson(json['product'])
          : null,
    );
  }
}
