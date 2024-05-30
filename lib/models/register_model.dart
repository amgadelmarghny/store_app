import 'package:Sourban/models/user_model.dart';

class Registermodel {
  final bool status;
  final String message;
  final UserModel? data;

  Registermodel({
    required this.status,
    required this.message,
    required this.data,
  });
  factory Registermodel.fromJson(Map<String, dynamic> json) {
    return Registermodel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? UserModel.fromJson(json['data']) : null,
    );
  }
}
