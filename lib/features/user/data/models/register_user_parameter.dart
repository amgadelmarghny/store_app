import 'package:equatable/equatable.dart';

class RegisterUserParameter extends Equatable {
  final String name, email, password, phone;

  const RegisterUserParameter({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  @override
  List<Object?> get props => [name, email, password, phone];
}
