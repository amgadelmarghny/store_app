import 'package:equatable/equatable.dart';

class NewAddress extends Equatable {
  final bool status;
  final String? message;

  const NewAddress({
    required this.status,
    required this.message,
  });
  @override
  List<Object?> get props => [
        status,
        message,
      ];
}
