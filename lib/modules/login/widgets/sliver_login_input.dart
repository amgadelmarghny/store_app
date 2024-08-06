import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Sourban/shared/bloc/auth_cubit/auth_cubit.dart';
import 'package:Sourban/modules/login/widgets/login_button.dart';
import 'package:Sourban/shared/components/text_form_field.dart';

class SliverLoginInfo extends StatelessWidget {
  const SliverLoginInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocBuilder<AuthCubit,AuthState>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 5,
              left: 20,
              right: 20,
            ),
            child: Form(
              key: formKey,
              autovalidateMode:
                  BlocProvider.of<AuthCubit>(context).autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    prefixIcon: Icons.email_outlined,
                    hintText: 'Enter Email',
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    labelText: "Email",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    obscureText: BlocProvider.of<AuthCubit>(context).obscureText,
                    prefixIcon: Icons.lock_outline,
                    controller: passwordController,
                    // add on submitted to do the same as on pressed of custom button
                    onFieldSubmitted: (value) {
                      loginTap(
                          context, formKey, emailController, passwordController);
                    },
                    hintText: 'Enter Password',
                    textInputType: TextInputType.visiblePassword,
                    suffixIcon: BlocProvider.of<AuthCubit>(context).suffixIcon,
                    suffixOnPressed: () {
                      BlocProvider.of<AuthCubit>(context).onEyesPressed();
                    },
                    labelText: "Password",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget you password?',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  LoginButtonBlocConsumer(
                    emailController: emailController,
                    passwordController: passwordController,
                    formKey: formKey,
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
