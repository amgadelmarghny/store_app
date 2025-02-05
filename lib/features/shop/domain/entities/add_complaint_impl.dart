import 'package:equatable/equatable.dart';

class AddComplaintImpl extends Equatable {
  final String name, email, phone, message;

  const AddComplaintImpl({
    required this.name,
    required this.email,
    required this.phone,
    required this.message,
  });

  @override
  List<Object?> get props => [name, email, phone, message];
}
