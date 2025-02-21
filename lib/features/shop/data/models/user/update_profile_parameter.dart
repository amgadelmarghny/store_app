import 'package:equatable/equatable.dart';

class UpdateProfileParameter extends Equatable {
  final String? name;
  final String? email;
  final String? phone, image;

  const UpdateProfileParameter({
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
  });

  @override
  List<Object?> get props => [name, email, phone];
}
