import 'package:soagmb/features/shop/data/models/favorite_data_model.dart';
import 'package:soagmb/features/shop/domain/entities/change_favorite.dart';

class ChangedFavoriteModel extends ChangedFavorite {
  const ChangedFavoriteModel({
    required super.quantity,
    required super.status,
    required super.message,
    required super.dataModel,
  });

  factory ChangedFavoriteModel.fromJson(Map<String, dynamic> json) {
    return ChangedFavoriteModel(
      quantity: json['quantity'],
      status: json['status'],
      message: json['message'],
      dataModel: json['data'] != null
          ? FavDataModel.fromJson(json['data'])
          : json['data'],
    );
  }
}
