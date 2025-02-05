import 'package:soagmb/features/shop/data/models/product_model.dart';
import 'package:soagmb/features/shop/domain/entities/favorite_data.dart';

class FavDataModel extends FavData {
  const FavDataModel({
    required super.id,
    required super.product,
  });

  factory FavDataModel.fromJson(Map<String, dynamic> json) {
    return FavDataModel(
      id: json['id'],
      product: json['product'] != null
          ? ProductModel.fromJson(json['product'])
          : null,
    );
  }
}
