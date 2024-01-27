import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_2/shared/componants/custom_curve_color_ui.dart';
import 'package:store_2/shared/style/colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: defaultColor,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: defaultColor,
      ),
      body: const Column(
        children: [
          CurveColorUI(
            headLine: 'Create Your Account',
            subHeadline: 'Please login with your personal information.',
            color: defaultColor,
          ),
        ],
      ),
    );
  }
}
