import 'package:equatable/equatable.dart';

class UpdateCartItemsImpl extends Equatable {
  final int id, quantity;

  const UpdateCartItemsImpl({required this.id, required this.quantity});

  @override
  List<Object?> get props => [id, quantity];
}
