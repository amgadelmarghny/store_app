import 'package:equatable/equatable.dart';
import 'package:soagmb/features/shop/domain/entities/product.dart';

class CartItem extends Equatable {
  final int id;
  final int quantity;
  final Product product;

  const CartItem({
    required this.id,
    required this.quantity,
    required this.product,
  });

  @override
  List<Object?> get props => [id, quantity, quantity];
}
