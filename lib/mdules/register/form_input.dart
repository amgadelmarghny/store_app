import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/models/user_model/user_model.dart';
import 'package:store_2/shared/bloc/auth_cubit/auth_cubit.dart';
import 'package:store_2/shared/components/custom_buttomt.dart';
import 'package:store_2/shared/components/icon_auth_list_view.dart';
import 'package:store_2/shared/components/textformfield.dart';

Form registerFormInput(
    GlobalKey<FormState> formKey, BuildContext context, AuthState state) {
  String? name, email, password, phone;

  return Form(
    key: formKey,
    autovalidateMode: BlocProvider.of<AuthCubit>(context).autovalidateMode,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          prefixIcon: Icons.person_outline,
          onChange: (value) {
            name = value;
          },
          hintText: 'Enter Name',
          textInputType: TextInputType.name,
          labelText: "Name",
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          prefixIcon: Icons.email_outlined,
          onChange: (value) {
            email = value;
          },
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
          onChange: (value) {
            password = value;
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
        CustomTextField(
          prefixIcon: Icons.phone_outlined,
          onChange: (value) {
            phone = value;
          },
          hintText: 'Enter Phone Number',
          textInputType: TextInputType.phone,
          labelText: 'Phone',
        ),
        const SizedBox(
          height: 30,
        ),
        CustomButton(
          text: 'SIGN UP',
          isLoading: state is RegisterLodingState ? true : false,
          onTap: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              UserModel userModel = UserModel(
                name: name!,
                email: email!,
                password: password!,
                phone: phone!,
              );
              BlocProvider.of<AuthCubit>(context)
                  .userRegister(userModel: userModel);
            } else {
              BlocProvider.of<AuthCubit>(context).validateObserver();
            }
          },
          // to make button color gradient
          isAuth: true,
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            'Sign up With',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const IconAuthlistView(),
      ],
    ),
  );
}
