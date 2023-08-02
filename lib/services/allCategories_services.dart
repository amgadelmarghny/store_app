// ignore_for_file: file_names

import 'package:store_app/helper/API.dart';

class AllCategories {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data =
        await API().get(uri:
         'https://fakestoreapi.com/products/categories');

    return data;
  }
}
