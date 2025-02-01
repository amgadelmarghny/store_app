import 'package:equatable/equatable.dart';

class AddNewOrder extends Equatable {
  final bool status;
  final String message;

  const AddNewOrder({required this.status, required this.message});

  @override
  List<Object?> get props => [status, message];
}
