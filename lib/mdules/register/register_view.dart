import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_2/mdules/register/register_view_body.dart';
import 'package:store_2/shared/style/colors.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String id = 'register';
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
      body: const RegisterViewBody(),
    );
  }
}
