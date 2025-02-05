import 'package:equatable/equatable.dart';
import 'package:soagmb/features/shop/domain/entities/favorite_data.dart';

class ChangedFavorite extends Equatable {
  final bool status;
  final String message;
  final dynamic quantity;
  final FavData? dataModel;

  const ChangedFavorite({
    required this.status,
    required this.message,
    required this.quantity,
    required this.dataModel,
  });

  @override
  List<Object?> get props => [status, message, quantity, dataModel];
}
