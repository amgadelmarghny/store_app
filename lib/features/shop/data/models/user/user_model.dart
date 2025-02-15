import 'package:soagmb/features/shop/domain/entities/user/user.dart';

class UserModel extends User {
  const UserModel({
    super.id,
    super.image,
    super.point,
    super.credit,
    super.token,
    super.name,
    super.email,
    super.password,
    super.phone,
  });

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      id: json['id'],
      image: json['image'],
      point: json['point'],
      token: json['token'],
      credit: json['credit'],
    );
  }
}
