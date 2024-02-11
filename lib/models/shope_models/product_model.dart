class ProductModel {
  final int id;
  final String name;
  final dynamic price;
  final dynamic oldPrice;
  final String image;
  final String description;
  final dynamic discount;
  final List images;
  final bool inFavorites;
  final bool inCart;

  ProductModel({
    required this.images,
    required this.id,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.image,
    required this.description,
    required this.discount,
    required this.inFavorites,
    required this.inCart,
  });
  factory ProductModel.fromJson(dynamic json) {
    return ProductModel(
      images: json['images'],
      id: json['id'],
      name: json['name'],
      price: json['price'],
      oldPrice: json['old_price'],
      image: json['image'],
      description: json['description'],
      discount: json['discount'],
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}
