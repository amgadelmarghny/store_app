import 'package:equatable/equatable.dart';

class UpdateAddress extends Equatable {
  final bool status;
  final String message;

  const UpdateAddress({
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => [status, message];
}
