import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/shared/bloc/auth_cubit/auth_cubit.dart';
import 'package:store_2/shared/componants/custom_buttomt.dart';
import 'package:store_2/shared/componants/icon_auth_list_view.dart';
import 'package:store_2/shared/componants/textformfield.dart';

class SliverLoginInfo extends StatelessWidget {
  const SliverLoginInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                    prefixIcon: Icons.email_outlined,
                    onChange: (value) {},
                    hintText: 'Enter Email',
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
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forget you password?',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButtomShet(
                    text: 'Login',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      } else {
                        BlocProvider.of<AuthCubit>(context).validateObserver();
                      }
                    },
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
