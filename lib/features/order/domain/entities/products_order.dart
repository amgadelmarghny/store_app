import 'package:equatable/equatable.dart';

class ProductsOrder extends Equatable {
  final int id;
  final int? quantity;
  final dynamic price;
  final String name;
  final String image;

  const ProductsOrder(
      {required this.id,
      required this.quantity,
      required this.price,
      required this.name,
      required this.image});

  @override
  List<Object?> get props => [id, quantity, price, name, image];
}
