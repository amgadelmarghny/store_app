import 'package:store_2/models/shope_models/product_model.dart';

class CategoryDetailsModel {
  bool? status;
  String? message;
  CategoryDetailsData? categoryDetailsData;

  CategoryDetailsModel({this.status, this.message, this.categoryDetailsData});

  CategoryDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    categoryDetailsData = json['data'] != null
        ? CategoryDetailsData.fromJson(json['data'])
        : null;
  }
}

class CategoryDetailsData {
  int? currentPage;
  List<ProductModel>? productModelList;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  CategoryDetailsData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      productModelList = <ProductModel>[];
      json['data'].forEach((v) {
        productModelList!.add(ProductModel.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}
