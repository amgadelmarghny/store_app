import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/services/service_locator.dart';
import 'package:soagmb/features/user/presentation/widgets/register_view_body.dart';
import 'package:soagmb/features/user/presentation/cubit/auth_cubit.dart';
import 'package:soagmb/core/global/style/colors.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String id = 'register';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(sl(), sl(), sl(), sl()),
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
