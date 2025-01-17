import 'package:equatable/equatable.dart';

class LoginUserParameter extends Equatable {
  final String email, password;

  const LoginUserParameter({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
