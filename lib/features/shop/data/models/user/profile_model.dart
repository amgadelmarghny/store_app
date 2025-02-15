import 'package:soagmb/features/shop/data/models/user/user_model.dart';
import 'package:soagmb/features/shop/domain/entities/user/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.status,
    required super.message,
    required super.user,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      status: json['status'],
      message: json['message'],
      user: json['data'] != null ? UserModel.fromJson(json['data']) : null,
    );
  }
}
