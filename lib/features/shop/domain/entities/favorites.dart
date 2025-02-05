import 'package:equatable/equatable.dart';
import 'package:soagmb/features/shop/domain/entities/favorite_data.dart';

class GetFavorites extends Equatable {
  final bool status;
  final String? message;
  final FavoritesData? favoritesDataModel;

  const GetFavorites({
    required this.status,
    required this.message,
    required this.favoritesDataModel,
  });

  @override
  List<Object?> get props => [status, message, favoritesDataModel];
}

class FavoritesData extends Equatable {
  final List<FavData> dataModelList;
  final int total;
  const FavoritesData({required this.total, required this.dataModelList});

  @override
  List<Object?> get props => [total, dataModelList];
}
