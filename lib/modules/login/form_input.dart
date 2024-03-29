import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/shared/bloc/auth_cubit/auth_cubit.dart';
import 'package:store_2/shared/components/custom_buttomt.dart';
import 'package:store_2/shared/components/icon_auth_list_view.dart';
import 'package:store_2/shared/components/textformfield.dart';

Form loginFormInput(
    GlobalKey<FormState> formKey, BuildContext context, AuthState state) {
  return Form(
    key: formKey,
    autovalidateMode: BlocProvider.of<AuthCubit>(context).autovalidateMode,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          prefixIcon: Icons.email_outlined,
          onChange: (value) {
            context.read<AuthCubit>().email = value;
          },
          hintText: 'Enter Email',
          textInputType: TextInputType.emailAddress,
          labelText: "Email",
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          obscureText: BlocProvider.of<AuthCubit>(context).obscureText,
          prefixIcon: Icons.lock_outline,
          onChange: (value) {
            context.read<AuthCubit>().passWord = value;
          },
          // add on submitted to do the same as on pressed of custom button
          onFieldSubmitted: (value) {
            if (formKey.currentState!.validate()) {
              context.read<AuthCubit>().userLogin();
              formKey.currentState!.save();
            } else {
              BlocProvider.of<AuthCubit>(context).validateObserver();
            }
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
        CustomButton(
          isLoading: state is LoginLodingState ? true : false,
          text: 'Login',
          onTap: () {
            if (formKey.currentState!.validate()) {
              context.read<AuthCubit>().userLogin();
              formKey.currentState!.save();
            } else {
              BlocProvider.of<AuthCubit>(context).validateObserver();
            }
          },
          // to make button color gradient
          isGradientColor: true,
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login With',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        const IconAuthlistView(),
      ],
    ),
  );
}
