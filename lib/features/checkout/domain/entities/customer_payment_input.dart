import 'package:equatable/equatable.dart';

class CustomerPaymentInput extends Equatable {
  final String? name;
  final String? phone;
  final String? email;

  const CustomerPaymentInput({this.name, this.phone, this.email});

  @override
  List<Object?> get props => [name, phone, email];
}
