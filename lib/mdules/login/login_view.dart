import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/shared/bloc/auth_cubit/auth_cubit.dart';
import 'package:store_2/shared/componants/custom_curve_color_ui.dart';
import 'package:store_2/shared/componants/textformfield.dart';
import 'package:store_2/shared/style/colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: defaultColor,
                statusBarIconBrightness: Brightness.light,
              ),
              backgroundColor: defaultColor,
            ),
            body: Column(
              children: [
                const CurveColorUI(
                  headLine: 'Create Your Account',
                  subHeadline: 'Please login with your personal information.',
                  color: defaultColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      CustomTextField(
                        prefixIcon: Icons.email_outlined,
                        onChange: (value) {},
                        hintText: 'Email',
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        obscureText:
                            BlocProvider.of<AuthCubit>(context).obscureText,
                        prefixIcon: Icons.lock_outline,
                        onChange: (value) {},
                        hintText: 'Password',
                        textInputType: TextInputType.visiblePassword,
                        suffixIcon:
                            BlocProvider.of<AuthCubit>(context).suffixIcon,
                        suffixOnPressed: () {
                          BlocProvider.of<AuthCubit>(context).onEyesPressed();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
