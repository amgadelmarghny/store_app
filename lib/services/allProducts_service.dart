// ignore_for_file: file_names

import 'dart:convert';
import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class ALLProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    http.Response response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<ProductModel> theProductsList = [];
      for (int i = 0; i < data.length; i++) {
        theProductsList.add(ProductModel.fromJson(data[i]));
      }
      return theProductsList;
    } else {
      throw Exception(
          'there is problem in StatusCode , is = ${response.statusCode}');
    }
  }
}
