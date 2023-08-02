import 'package:store_app/helper/API.dart';
import 'package:store_app/models/product_model.dart';

class GetCategoryProduct {
  Future<List<ProductModel>> getCategoryProduct(String categoryName) async {
    List<dynamic> data = await API()
        .get(uri: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> theProductsList = [];
    for (int i = 0; i < data.length; i++) {
      theProductsList.add(ProductModel.fromJson(data[i]));
    }
    return theProductsList;
  }
}
