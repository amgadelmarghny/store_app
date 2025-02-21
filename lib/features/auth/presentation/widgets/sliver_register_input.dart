import 'package:flutter/material.dart';
import 'package:soagmb/features/auth/presentation/widgets/register_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/text_form_field.dart';
import 'package:soagmb/generated/l10n.dart';

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
                    hintText: S.of(context).name,
                    textInputType: TextInputType.name,
                    labelText: S.of(context).name,
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
                    hintText: S.of(context).email,
                    textInputType: TextInputType.emailAddress,
                    labelText: S.of(context).email,
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
                    hintText: S.of(context).password,
                    textInputType: TextInputType.visiblePassword,
                    suffixIcon: BlocProvider.of<AuthCubit>(context).suffixIcon,
                    suffixOnPressed: () {
                      BlocProvider.of<AuthCubit>(context).onEyesPressed();
                    },
                    labelText: S.of(context).password,
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
                    hintText: S.of(context).phone,
                    textInputType: TextInputType.phone,
                    labelText: S.of(context).phone,
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
