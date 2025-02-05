import 'package:soagmb/features/shop/domain/entities/logout.dart';
import 'package:soagmb/features/user/data/models/user_model.dart';

class LogoutModel extends Logout {
  const LogoutModel({
    required super.status,
    required super.message,
    required super.userData,
  });

  factory LogoutModel.fromJson(Map<String, dynamic> json) {
    return LogoutModel(
      status: json['status'],
      message: json['message'],
      userData: json['data'] != null ? UserModel.fromJson(json['data']) : null,
    );
  }
}
