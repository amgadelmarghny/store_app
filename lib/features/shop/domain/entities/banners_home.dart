import 'package:equatable/equatable.dart';
import 'package:soagmb/features/shop/domain/entities/product.dart';

class BannersHome extends Equatable {
  final int id;
  final String image;
  final Map<String, dynamic>? category;
  final Product? product;

  const BannersHome(
      {required this.id,
      required this.image,
      required this.category,
      required this.product});

  @override
  List<Object?> get props => [id, image, category, product];
}
