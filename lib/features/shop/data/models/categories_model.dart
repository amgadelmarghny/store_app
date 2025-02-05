import 'package:soagmb/features/shop/data/models/category_model.dart';
import 'package:soagmb/features/shop/domain/entities/categories.dart';

class CategoriesModel extends Categories {
  const CategoriesModel({
    required super.status,
    required super.catHomeData,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      status: json['status'],
      catHomeData: CategoriesDataModel.fromJson(json['data']),
    );
  }
}

class CategoriesDataModel extends CategoriesData {
  const CategoriesDataModel({
    required super.currentPage,
    required super.dataList,
  });

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    return CategoriesDataModel(
      currentPage: json['current_page'],
      dataList: List.from(
        (json['data'] as List).map((e) => CategoryModel.fromJson(e)),
      ),
    );
  }
}
