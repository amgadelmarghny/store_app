import 'package:soagmb/features/shop/data/models/favorite_data_model.dart';
import 'package:soagmb/features/shop/domain/entities/favorites.dart';

class GetFavoritesModel extends GetFavorites {
  const GetFavoritesModel({
    required super.status,
    required super.message,
    required super.favoritesDataModel,
  });
  factory GetFavoritesModel.fromJson(Map<String, dynamic> json) {
    return GetFavoritesModel(
      status: json['status'],
      message: json['message'],
      favoritesDataModel: json['data'] != null
          ? FavoritesDataModel.fromJson(json['data'])
          : null,
    );
  }
}

class FavoritesDataModel extends FavoritesData {
  const FavoritesDataModel({
    required super.dataModelList,
    required super.total,
  });

  factory FavoritesDataModel.fromJson(Map<String, dynamic> json) {
    return FavoritesDataModel(
      total: json['total'],
      dataModelList:
          List.from(json['data'].map((e) => FavDataModel.fromJson(e))),
    );
  }
}
