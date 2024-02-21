class ProductModel {
  final int id;
  final dynamic price, oldPrice;
  final String image;
  final String? name, description;
  final dynamic discount;
  final List? images;
  final bool? inFavorites;
  final bool? inCart;

  ProductModel({
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
