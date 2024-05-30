import 'package:Sourban/models/user_model.dart';

class LoginModel {
  final bool status;
  final String message;
  final UserModel? data;

  LoginModel({
    required this.status,
    required this.message,
    required this.data,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? UserModel.fromJson(json['data']) : null,
    );
  }
}
