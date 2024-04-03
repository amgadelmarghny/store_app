import 'package:flutter/material.dart';
import 'package:store_2/modules/profile/update_profile_body.dart';
import 'package:store_2/models/user_model.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});
  static String id = "Update Profile";
  @override
  Widget build(BuildContext context) {
    UserModel userModel =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBar(),
      body: UpdateProfileViewBody(userModel: userModel),
    );
  }
}
