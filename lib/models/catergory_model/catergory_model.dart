class CategoriesModel {
  final bool status;
  final CategoriesDataModel? dataCatHome;

  CategoriesModel({required this.status, required this.dataCatHome});
  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      status: json['status'],
      dataCatHome: CategoriesDataModel.fromJson(json['data']),
    );
  }
}

class CategoriesDataModel {
  final int currentPage;
  final List<dynamic> data;

  CategoriesDataModel({required this.currentPage, required this.data});
  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    return CategoriesDataModel(
        currentPage: json['current_page'], data: json['data']);
  }
}

class DataModel {
  final int id;
  final String name;
  final String image;

  DataModel({
    required this.id,
    required this.name,
    required this.image,
  });
  factory DataModel.fromJson(json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
