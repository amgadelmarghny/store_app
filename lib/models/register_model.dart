import 'package:soagmb/models/user_model.dart';

class RegisterModel {
  final bool status;
  final String message;
  final UserModel? data;

  RegisterModel({
    required this.status,
    required this.message,
    required this.data,
  });
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? UserModel.fromJson(json['data']) : null,
    );
  }
}
