import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/services/service_locator.dart';
import 'package:soagmb/features/user/presentation/cubit/auth_cubit.dart';
import 'package:soagmb/features/user/presentation/widgets/change_password_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  static const id = '/change-password';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(sl(), sl(), sl(), sl()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Change Password'),
        ),
        body: const ChangePasswordViewBody(),
      ),
    );
  }
}
