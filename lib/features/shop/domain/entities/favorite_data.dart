import 'package:equatable/equatable.dart';
import 'package:soagmb/features/shop/domain/entities/product.dart';

class FavData extends Equatable {
  final int id;
  final Product? product;

  const FavData({
    required this.id,
    required this.product,
  });
  @override
  List<Object?> get props => [id, product];
}
