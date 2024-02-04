import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/layout/shop/shop_view.dart';
import 'package:store_2/shared/bloc/auth_cubit/auth_cubit.dart';
import 'package:store_2/shared/componants/custom_buttomt.dart';
import 'package:store_2/shared/componants/custom_show_messeges.dart';
import 'package:store_2/shared/componants/icon_auth_list_view.dart';
import 'package:store_2/shared/componants/navigation.dart';
import 'package:store_2/shared/componants/textformfield.dart';
import 'package:store_2/shared/network/lockal/key_const.dart';
import 'package:store_2/shared/network/lockal/shared_helper.dart';

class SliverLoginInfo extends StatelessWidget {
  const SliverLoginInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? email, passWord;
    GlobalKey<FormState> formKey = GlobalKey();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is LoginFailureState) {
          snacKBar(context, state.err);
        }
        if (state is LoginSuccessState) {
          if (state.loginModel.status) {
            CashHelper.setData(
                    key: tOKENCONST, value: state.loginModel.data!.token)
                .then(
              (value) {
                toastShown(
                  messege: state.loginModel.message,
                  state: ToastState.success,
                  context: context,
                );
                navigatorPushAndRemove(
                  context,
                  ShopView.id,
                );
              },
            );
          } else {
            toastShown(
              messege: state.loginModel.message,
              state: ToastState.error,
              context: context,
            );
          }
        }
      },
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
                    onChange: (value) {
                      email = value;
                    },
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
                    onChange: (value) {
                      passWord = value;
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
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forget you password?',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButtomShet(
                    isLoading: state is LoginLodingState ? true : false,
                    text: 'Login',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context
                            .read<AuthCubit>()
                            .userLogin(email: email!, passWord: passWord!);
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
                    height: 30,
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
