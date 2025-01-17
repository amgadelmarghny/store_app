import 'package:soagmb/features/user/data/models/user_model.dart';
import 'package:soagmb/features/user/domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel({
    required super.status,
    required super.message,
    required super.user,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'],
      message: json['message'],
      user: json['data'] != null ? UserModel.fromJson(json['data']) : null,
    );
  }
}
