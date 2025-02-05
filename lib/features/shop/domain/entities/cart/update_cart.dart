import 'package:equatable/equatable.dart';
import 'package:soagmb/features/shop/domain/entities/cart/cart_item.dart';

class UpdateCart extends Equatable {
  final bool status;
  final String message;
  final UpdateCartData? data;

  const UpdateCart({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [status, message, data];
}

class UpdateCartData extends Equatable {
  final CartItem cartItemUpdated;
  final dynamic subTotal;
  final dynamic total;

  const UpdateCartData(
      {required this.cartItemUpdated,
      required this.subTotal,
      required this.total});

  @override
  List<Object?> get props => [cartItemUpdated, subTotal, total];
}
