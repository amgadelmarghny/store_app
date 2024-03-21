

class UserModel {
  final dynamic id;
  final String? image;
  final dynamic point;
  final dynamic credit;
  final String? token;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;

const UserModel({
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
