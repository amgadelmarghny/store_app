import 'package:flutter/material.dart';
import 'package:store_2/mdules/profile/update_profile_body.dart';

class UpadteProfileView extends StatelessWidget {
  const UpadteProfileView({super.key});
  static String id = "Update Profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const UpadteProfileViewBody(),
    );
  }
}
