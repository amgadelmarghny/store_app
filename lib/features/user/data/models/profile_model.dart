import 'package:soagmb/features/user/data/models/user_model.dart';

class ProfileModel {
  final bool status;
  final String? message;
  final UserModel? user;

  ProfileModel({
    required this.status,
    required this.message,
    required this.user,
  });
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      status: json['status'],
      message: json['message'],
      user: json['data'] != null ? UserModel.fromJson(json['data']) : null,
    );
  }
}
