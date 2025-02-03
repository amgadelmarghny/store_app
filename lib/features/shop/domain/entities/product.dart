import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final dynamic price, oldPrice;
  final String image;
  final String? name, description;
  final dynamic discount;
  final List? images;
  final bool? inFavorites;
  final bool? inCart;

  const Product({
    required this.id,
    this.name,
    required this.price,
    required this.oldPrice,
    required this.image,
    this.description,
    required this.discount,
    this.images,
    this.inFavorites,
    this.inCart,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        oldPrice,
        image,
        description,
        discount,
        images,
        inFavorites,
        inCart
      ];
}
