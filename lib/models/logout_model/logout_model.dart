import 'package:store_2/models/user_model/user_model.dart';

class LogoutModel {
  final bool status;
  final String message;
  final UserModel? data;

  LogoutModel({
    required this.status,
    required this.message,
    required this.data,
  });
  factory LogoutModel.fromJson(Map<String, dynamic> json) {
    return LogoutModel(
      status: json['status'],
      message: json['message'],
      data: json['data']!= null ? UserModel.fromJson(json['data']) : null,
    );
  }
}
