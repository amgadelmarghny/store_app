import 'package:equatable/equatable.dart';
import 'package:soagmb/features/shop/domain/entities/cart/cart_item.dart';

class GetCart extends Equatable {
  final bool status;
  final String? message;
  final GetCartData? data;

  const GetCart(
      {required this.status, required this.message, required this.data});

  @override
  List<Object?> get props => [status, message, data];
}

class GetCartData extends Equatable {
  final dynamic total;
  final List<CartItem> cartItemsList;

  const GetCartData({required this.total, required this.cartItemsList});

  @override
  List<Object?> get props => [total, cartItemsList];
}
