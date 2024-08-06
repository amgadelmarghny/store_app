import 'package:flutter/material.dart';
import 'package:soagmb/modules/register/widgets/register_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/shared/bloc/auth_cubit/auth_cubit.dart';
import 'package:soagmb/shared/components/text_form_field.dart';

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

    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
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
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  prefixIcon: Icons.email_outlined,
                  controller: emailController,
                  hintText: ' Enter Email',
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
                CustomTextField(
                  prefixIcon: Icons.phone_outlined,
                  controller: phoneController,
                  hintText: 'Enter Phone Number',
                  textInputType: TextInputType.phone,
                  labelText: 'Phone',
                ),
                const SizedBox(
                  height: 30,
                ),
                RegisterButttonConsumer(
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
    });
  }
}
