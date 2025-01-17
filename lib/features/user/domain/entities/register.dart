import 'package:equatable/equatable.dart';
import 'package:soagmb/features/user/domain/entities/user.dart';

class Register extends Equatable {
  final bool status;
  final String message;
  final User? user;

  const Register(
      {required this.status, required this.message, required this.user});

  @override
  List<Object?> get props => [status, message, user];
}
