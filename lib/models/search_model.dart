import 'package:Sourban/models/shope_models/product_model.dart';

class SearchModel {
  final bool status;
  final String? message;
  final SearchDataModel? favoritesDataModel;

  SearchModel(
      {required this.status,
      required this.message,
      required this.favoritesDataModel});
  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      status: json['status'],
      message: json['message'],
      favoritesDataModel:
          json['data'] != null ? SearchDataModel.fromJson(json['data']) : null,
    );
  }
}

class SearchDataModel {
  int? currentPage;
  List dataModelList = [];

  SearchDataModel({
    required this.currentPage,
    required this.dataModelList,
  });

  SearchDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];

    json['data'].forEach((v) {
      dataModelList.add(ProductModel.fromJson(v));
    });
  }
}
