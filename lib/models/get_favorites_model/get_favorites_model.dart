import 'package:store_2/models/shope_models/product_model.dart';

class GetFavoritesModel {
  final bool status;
  final String? message;
  final FavoritesDataModel? favoritesDataModel;

  GetFavoritesModel(
      {required this.status,
      required this.message,
      required this.favoritesDataModel});
  factory GetFavoritesModel.fromJson(Map<String, dynamic> json) {
    return GetFavoritesModel(
      status: json['status'],
      message: json['message'],
      favoritesDataModel: json['data'] != null
          ? FavoritesDataModel.fromJson(json['data'])
          : null,
    );
  }
}

class FavoritesDataModel {
  final int currentPage;
  final List? dataModel;

  FavoritesDataModel({
    required this.currentPage,
    required this.dataModel,
  });

  factory FavoritesDataModel.fromJson(Map<String, dynamic> json) {
    return FavoritesDataModel(
      currentPage: json['current_page'],
      dataModel: json['data'],
    );
  }
}

class Data {
  final int id;
  final ProductModel? productModel;

  Data({required this.id, required this.productModel});

  factory Data.fromJson(dynamic json) {
    return Data(
        id: json['id'],
        productModel: json['product'] != null
            ? ProductModel.fromJson(json['product'])
            : null);
  }
}
