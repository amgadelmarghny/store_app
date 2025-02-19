import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/presentation/views/change_password_view.dart';
import 'package:soagmb/features/shop/domain/entities/user/user.dart';
import 'package:soagmb/features/shop/presentation/views/update_profile_view.dart';
import 'package:soagmb/core/global/style/colors.dart';
import 'package:soagmb/core/global/style/themes.dart';
import 'package:soagmb/generated/l10n.dart';

class UpdateProfileButtons extends StatelessWidget {
  const UpdateProfileButtons({super.key, required this.userModel});
  final User userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, ChangePasswordView.id,
                  arguments: userModel);
            },
            child: Text(
              S.of(context).change_password,
              style: underLineDecoration(context),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, UpdateProfileView.id,
                  arguments: userModel);
            },
            child: Text(
              S.of(context).modify_profile,
              style: underLineDecoration(context),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle underLineDecoration(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: getResponsiveFontSize(fontSize: 17.2),
          decoration: TextDecoration.underline,
          decorationColor: defaultColor,
        );
  }
}
