import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/mdules/register/register_view_body.dart';
import 'package:store_2/shared/bloc/auth_cubit/auth_cubit.dart';
import 'package:store_2/shared/componants/custom_show_messeges.dart';
import 'package:store_2/shared/style/colors.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String id = 'register';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterFailureState) {
          snacKBar(context, state.err);
        }
      },
      builder: (context, state) {
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
      },
    );
  }
}
