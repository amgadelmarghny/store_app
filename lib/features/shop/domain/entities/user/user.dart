import 'package:equatable/equatable.dart';

class User extends Equatable {
  final dynamic id;
  final String? image;
  final dynamic point;
  final dynamic credit;
  final String? token;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;

  const User({
    this.id,
    this.image,
    this.point,
    this.credit,
    this.token,
    this.name,
    this.email,
    this.password,
    this.phone,
  });

  @override
  List<Object?> get props =>
      [id, image, point, credit, token, name, email, password, phone];
}
