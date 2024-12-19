import 'package:flutter/material.dart';
import 'package:soagmb/models/user_model.dart';
import 'package:soagmb/modules/profile/change_password_view.dart';
import 'package:soagmb/modules/profile/update_profile_view.dart';
import 'package:soagmb/shared/style/colors.dart';
import 'package:soagmb/shared/style/themes.dart';

class ModifyProfileButtons extends StatelessWidget {
  const ModifyProfileButtons({super.key, required this.userData});
  final UserModel userData;

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
                  arguments: userData);
            },
            child: Text(
              'Change your password',
              style: underLineDecoration(context),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, UpdateProfileView.id,
                  arguments: userData);
            },
            child: Text(
              'Modify your profile',
              style: underLineDecoration(context),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle underLineDecoration(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: defaultColor,
          fontSize: getResponsiveFontSize(fontSize: 17.2),
          decoration: TextDecoration.underline,
          decorationColor: defaultColor,
        );
  }
}
