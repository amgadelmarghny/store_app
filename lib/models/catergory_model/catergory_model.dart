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
  int? currentPage;
  List<dynamic> dataList = [];

  CategoriesDataModel({required this.currentPage, required this.dataList});
  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((element) {
      dataList.add(DataModel.fromJson(element));
    });
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
