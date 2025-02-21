import 'package:soagmb/features/search/data/models/search_data_model.dart';
import 'package:soagmb/features/search/domain/entities/search.dart';

class SearchModel extends Search {
  const SearchModel(
      {required super.status,
      required super.message,
      required super.searchData});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      status: json['status'],
      message: json['message'],
      searchData:
          json['data'] != null ? SearchDataModel.fromJson(json['data']) : null,
    );
  }
}
