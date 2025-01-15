import 'package:soagmb/features/search/domain/entities/search_data.dart';
import 'package:soagmb/models/shop_models/product_model.dart';

class SearchDataModel extends SearchData {
  const SearchDataModel({
    required super.currentPage,
    required super.dataModelList,
  });

  factory SearchDataModel.fromJson(Map<String, dynamic> json) {
    return SearchDataModel(
      currentPage: json['current_page'],
      dataModelList: List<ProductModel>.from(
        json['data'].map((e) => ProductModel.fromJson(e)),
      ),
    );
  }
}
