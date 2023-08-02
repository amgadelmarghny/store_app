class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final RateModel? rate;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rate,
  });

  factory ProductModel.fromJson(dynamic jsonData) {
    return ProductModel(
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'],
        description: jsonData['description'],
        category: jsonData['category'],
        image: jsonData['image'],
        rate: 
        jsonData['rating'] == null 
         ? null : 
            RateModel.fromJson(jsonData['rating']));
  }
}

class RateModel {
  final dynamic rate;
  final int count;

  RateModel({
    required this.rate,
    required this.count,
  });
  factory RateModel.fromJson(dynamic jsonData) {
    return RateModel(
      rate: jsonData['rate'],
      count: jsonData['count'],
    );
  }
}
