import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/services/service_locator.dart';
import 'package:soagmb/features/auth/presentation/widgets/login_view_body.dart';
import 'package:soagmb/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:soagmb/core/global/style/colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => sl(),
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
