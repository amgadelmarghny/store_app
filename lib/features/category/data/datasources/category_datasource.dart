import 'package:soagmb/core/global/errors/server_exception.dart';
import 'package:soagmb/core/network/remote/dio_helper_for_shop.dart';
import 'package:soagmb/features/category/data/models/category_details_model.dart';

abstract class BaseCategoryDatasource {
  Future<CategoryDetailsModel> getCategoryDetailsById(int id);
}

class CategoryDatasource implements BaseCategoryDatasource {
  @override
  Future<CategoryDetailsModel> getCategoryDetailsById(int id) async {
    final response = await DioHelper.getData(url: 'categories/$id');
    if (response.statusCode == 200) {
      return CategoryDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: response.data);
    }
  }
}
