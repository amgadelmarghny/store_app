import 'package:equatable/equatable.dart';

class ChangeUserPasswordParameter extends Equatable {
  final String currentPassword;
  final String newPassword;

  const ChangeUserPasswordParameter({
    required this.currentPassword,
    required this.newPassword,
  });

  @override
  List<Object?> get props => [currentPassword, newPassword];
}
