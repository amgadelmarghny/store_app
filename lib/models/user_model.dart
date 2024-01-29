class UserModel {
  final String name;
  final String email;
  final String password;
  final String phone;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });
  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['number'],
    );
  }
}
