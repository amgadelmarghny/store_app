import 'package:equatable/equatable.dart';

class AddNewOrderParameter extends Equatable {
  final int addressId, paymentMethod;
  final bool usePoints;

  const AddNewOrderParameter({
    required this.addressId,
    required this.paymentMethod,
    required this.usePoints,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
