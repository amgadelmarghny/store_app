import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/presentation/widgets/change_password_view_body.dart';
import 'package:soagmb/generated/l10n.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  static const id = '/change-password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).change_password),
      ),
      body: const ChangePasswordViewBody(),
    );
  }
}
