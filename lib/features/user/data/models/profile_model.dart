import 'package:soagmb/features/user/data/models/user_model.dart';
import 'package:soagmb/features/user/domain/entities/profile.dart';

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
