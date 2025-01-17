import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/user/presentation/cubit/auth_cubit.dart';
import 'package:soagmb/features/user/presentation/widgets/login_button.dart';
import 'package:soagmb/features/shop/presentation/widgets/text_form_field.dart';

class SliverLoginInfo extends StatelessWidget {
  const SliverLoginInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    FocusNode passwordFocus = FocusNode();
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
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
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(passwordFocus);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  focusNode: passwordFocus,
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
    });
  }
}
