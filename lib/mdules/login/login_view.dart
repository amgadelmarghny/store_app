import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/shared/bloc/auth_cubit/auth_cubit.dart';
import 'package:store_2/shared/componants/custom_buttomt.dart';
import 'package:store_2/shared/componants/custom_curve_color_ui.dart';
import 'package:store_2/shared/componants/textformfield.dart';
import 'package:store_2/shared/style/colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = 'LoginView';
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
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget you password?',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButtomShet(
                        text: 'Login',
                        onTap: () {
                        },
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign Up',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
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
