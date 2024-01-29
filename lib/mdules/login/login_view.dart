import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_2/mdules/login/login_view_body.dart';
import 'package:store_2/shared/style/colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: defaultColor,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: defaultColor,
      ),
      body: const LoginViewBody(),
    );
  }
}
