import 'package:soagmb/features/shop/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    super.name,
    required super.price,
    required super.oldPrice,
    required super.image,
    super.description,
    required super.discount,
    super.images,
    super.inFavorites,
    super.inCart,
  });

  factory ProductModel.fromJson(dynamic json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      images: json['images'],
      oldPrice: json['old_price'],
      image: json['image'],
      description: json['description'],
      discount: json['discount'],
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}
