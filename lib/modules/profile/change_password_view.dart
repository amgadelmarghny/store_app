import 'package:flutter/material.dart';
import 'package:soagmb/modules/profile/change_password_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  static const id = '/change-password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: const ChangePasswordViewBody(),
    );
  }
}
