import 'package:flutter/material.dart';
import 'package:store_2/mdules/profile/update_profile_body.dart';
import 'package:store_2/models/user_model/user_model.dart';

class UpadteProfileView extends StatelessWidget {
  const UpadteProfileView({super.key});
  static String id = "Update Profile";
  @override
  Widget build(BuildContext context) {
    UserModel userModel =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBar(),
      body: UpadteProfileViewBody(userModel: userModel),
    );
  }
}
