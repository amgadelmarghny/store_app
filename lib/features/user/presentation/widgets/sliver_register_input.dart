import 'package:flutter/material.dart';
import 'package:soagmb/features/user/presentation/widgets/register_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/user/presentation/cubit/auth_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/text_form_field.dart';

class SliverRegisterInfo extends StatelessWidget {
  const SliverRegisterInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    FocusNode emailFocus = FocusNode();
    FocusNode passwordFocus = FocusNode();
    FocusNode phoneFocus = FocusNode();

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
            child: Form(
              key: formKey,
              autovalidateMode:
                  BlocProvider.of<AuthCubit>(context).autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    prefixIcon: Icons.person_outline,
                    controller: nameController,
                    hintText: 'Enter Name',
                    textInputType: TextInputType.name,
                    labelText: "Name",
                    onFieldSubmitted: (p0) {
                      FocusScope.of(context).requestFocus(emailFocus);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    focusNode: emailFocus,
                    prefixIcon: Icons.email_outlined,
                    controller: emailController,
                    hintText: ' Enter Email',
                    textInputType: TextInputType.emailAddress,
                    labelText: "Email",
                    onFieldSubmitted: (p0) {
                      FocusScope.of(context).requestFocus(passwordFocus);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    focusNode: passwordFocus,
                    obscureText:
                        BlocProvider.of<AuthCubit>(context).obscureText,
                    prefixIcon: Icons.lock_outline,
                    controller: passwordController,
                    hintText: 'Enter Password',
                    textInputType: TextInputType.visiblePassword,
                    suffixIcon: BlocProvider.of<AuthCubit>(context).suffixIcon,
                    suffixOnPressed: () {
                      BlocProvider.of<AuthCubit>(context).onEyesPressed();
                    },
                    labelText: "Password",
                    onFieldSubmitted: (p0) {
                      FocusScope.of(context).requestFocus(phoneFocus);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    focusNode: phoneFocus,
                    prefixIcon: Icons.phone_outlined,
                    controller: phoneController,
                    hintText: 'Enter Phone Number',
                    textInputType: TextInputType.phone,
                    labelText: 'Phone',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RegisterButtonConsumer(
                    nameController: nameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    phoneController: phoneController,
                    formKey: formKey,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
