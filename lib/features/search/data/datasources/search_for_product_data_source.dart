import 'package:dio/dio.dart';
import 'package:soagmb/core/global/errors/error_model.dart';
import 'package:soagmb/core/global/errors/server_exception.dart';
import 'package:soagmb/core/network/remote/dio_helper_for_shop.dart';
import 'package:soagmb/core/network/remote/end_points_url.dart';
import 'package:soagmb/features/search/data/models/search_for_product_parameter.dart';
import 'package:soagmb/features/search/data/models/search_model.dart';

abstract class BaseSearchForProductDataSource {
  Future<SearchModel> searchForProduct(
      {required SearchForProductParameter parameter});
}

class SearchForProductDataSource implements BaseSearchForProductDataSource {
  @override
  Future<SearchModel> searchForProduct(
      {required SearchForProductParameter parameter}) async {
    Response result = await DioHelper.postData(
      url: searchForProductPath,
      token: parameter.token,
      data: {"text": parameter.productName},
    );
    if (result.statusCode == 200) {
      return SearchModel.fromJson(result.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(result.data));
    }
  }
}
