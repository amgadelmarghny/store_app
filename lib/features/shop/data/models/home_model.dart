import 'package:soagmb/features/shop/data/models/banners_model.dart';
import 'package:soagmb/features/shop/data/models/product_model.dart';
import 'package:soagmb/features/shop/domain/entities/home.dart';

class HomeModel extends Home {
  const HomeModel({
    required super.status,
    required super.message,
    required super.data,
  });
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? HomeDataModel.fromJson(json['data']) : null,
    );
  }
}

class HomeDataModel extends HomeData {
  const HomeDataModel({
    required super.bannersList,
    required super.productsList,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    return HomeDataModel(
      bannersList: List.from(
        json['banners'].map((e) => BannersHomeModel.fromJson(e)),
      ),
      productsList: List.from(
        json['products'].map((e) => ProductModel.fromJson(e)),
      ),
    );
  }
}
