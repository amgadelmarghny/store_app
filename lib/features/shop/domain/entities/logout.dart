import 'package:equatable/equatable.dart';
import 'package:soagmb/features/shop/domain/entities/user/user.dart';

class Logout extends Equatable {
  final bool status;
  final String message;
  final User? userData;

  const Logout({
    required this.status,
    required this.message,
    required this.userData,
  });

  @override
  List<Object?> get props => [status, message, userData];
}
