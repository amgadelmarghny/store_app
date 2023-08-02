import 'package:flutter/material.dart';

import '../helper/API.dart';
import '../models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(
      {required int id,
      required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
            debugPrint('product id = $id');
    Map<String, dynamic> data =
        await API().put(url: "https://fakestoreapi.com/products/$id", body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    });
    return ProductModel.fromJson(data);
  }
}
