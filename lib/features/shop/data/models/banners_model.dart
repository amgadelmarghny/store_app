import 'package:soagmb/features/shop/data/models/product_model.dart';
import 'package:soagmb/features/shop/domain/entities/banners_home.dart';

class BannersHomeModel extends BannersHome {
  const BannersHomeModel({
    required super.category,
    required super.product,
    required super.id,
    required super.image,
  });

  factory BannersHomeModel.fromJson(Map<String, dynamic> json) {
    return BannersHomeModel(
      id: json['id'],
      image: json['image'],
      category: json['category'],
      product: json['product'] != null
          ? ProductModel.fromJson(
              json['product'],
            )
          : null,
    );
  }
}
