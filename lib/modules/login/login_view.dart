import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/modules/login/login_view_body.dart';
import 'package:soagmb/shared/bloc/auth_cubit/auth_cubit.dart';
import 'package:soagmb/core/global/style/colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              defaultColor[600]!,
              defaultColor[200]!,
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: const Scaffold(
          body: LoginViewBody(),
        ),
      ),
    );
  }
}
