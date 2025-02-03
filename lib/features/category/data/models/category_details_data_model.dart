import 'package:soagmb/features/category/domain/entities/category_datails_data.dart';
import 'package:soagmb/models/shop_models/product_model.dart';

class CategoryDetailsDataModel extends CategoryDetailsData {
  const CategoryDetailsDataModel({
    required super.currentPage,
    required super.productModelList,
    required super.firstPageUrl,
    required super.from,
    required super.lastPage,
    required super.lastPageUrl,
    required super.nextPageUrl,
    required super.path,
    required super.perPage,
    required super.prevPageUrl,
    required super.to,
    required super.total,
  });

  factory CategoryDetailsDataModel.fromJson(Map<String, dynamic> json) {
    return CategoryDetailsDataModel(
      currentPage: json['current_page'],
      productModelList: json['data'] != null
          ? List<ProductModel>.from(
              (json['data'] as List).map((e) => ProductModel.fromJson(e)),
            )
          : null,
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }
}
