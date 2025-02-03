import 'package:soagmb/features/category/data/models/category_details_data_model.dart';
import 'package:soagmb/features/category/domain/entities/category_details.dart';

class CategoryDetailsModel extends CategoryDetails {
  const CategoryDetailsModel({
    required super.status,
    required super.message,
    required super.categoryDetailsData,
  });

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json) {
    return CategoryDetailsModel(
      status: json['status'],
      message: json['message'],
      categoryDetailsData: json['data'] != null
          ? CategoryDetailsDataModel.fromJson(json['data'])
          : null,
    );
  }
}
