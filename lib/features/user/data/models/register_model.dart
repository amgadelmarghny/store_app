import 'package:soagmb/features/user/data/models/user_model.dart';
import 'package:soagmb/features/user/domain/entities/register.dart';

class RegisterModel extends Register {
  const RegisterModel({
    required super.status,
    required super.message,
    required super.user,
  });
  
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json['status'],
      message: json['message'],
      user: json['data'] != null ? UserModel.fromJson(json['data']) : null,
    );
  }
}
