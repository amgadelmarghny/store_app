import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/models/user_model.dart';
import 'package:store_2/shared/bloc/auth_cubit/auth_cubit.dart';
import 'package:store_2/shared/componants/custom_buttomt.dart';
import 'package:store_2/shared/componants/icon_auth_list_view.dart';
import 'package:store_2/shared/componants/textformfield.dart';

class SliverRegisterInfo extends StatelessWidget {
  const SliverRegisterInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? name, email, phone, password;
    GlobalKey<FormState> formKey = GlobalKey();
    
    return BlocBuilder<AuthCubit, AuthState>(
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
                    prefixIcon: Icons.person_outline,
                    onChange: (value) {
                      name = value;
                    },
                    hintText: 'Enter Name',
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    prefixIcon: Icons.email_outlined,
                    onChange: (value) {
                      email = value;
                    },
                    hintText: ' Enter Email',
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    obscureText:
                        BlocProvider.of<AuthCubit>(context).obscureText,
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
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButtomShet(
                    text: 'Sign Up',
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
                            .register(userModel: userModel);
                      } else {
                        BlocProvider.of<AuthCubit>(context).validateObserver();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign up With',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const IconAuthlistView(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}