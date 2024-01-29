class UserModel {
  final String name;
  final String email;
  final String password;
  final String number;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.number,
  });
  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      number: json['number'],
    );
  }
}
