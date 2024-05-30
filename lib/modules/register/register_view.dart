import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Sourban/modules/register/register_view_body.dart';
import 'package:Sourban/shared/bloc/auth_cubit/auth_cubit.dart';
import 'package:Sourban/shared/style/colors.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String id = 'register';
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
          body: RegisterViewBody(),
        ),
      ),
    );
  }
}
