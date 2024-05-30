import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Sourban/layout/shop/shop_view.dart';
import 'package:Sourban/shared/bloc/auth_cubit/auth_cubit.dart';
import 'package:Sourban/shared/components/custom_buttomt.dart';
import 'package:Sourban/shared/components/custom_show_messeges.dart';
import 'package:Sourban/shared/components/navigation.dart';
import 'package:Sourban/shared/feature/checkout/data/models/customer_payment_input_model.dart';
import 'package:Sourban/shared/network/local/key_const.dart';
import 'package:Sourban/shared/network/local/shared_helper.dart';

class LoginButtonBlocConsumer extends StatelessWidget {
  const LoginButtonBlocConsumer({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is LoginFailureState) {
          snacKBar(context, state.err);
        }
        if (state is CustomerPatymentFailure) {
          toastShown(
            messege: 'Some thing went wrong',
            state: ToastState.error,
            context: context,
          );
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
        return CustomButton(
          isLoading:
              state is LoginLodingState || state is CustomerPatymentLoding,
          text: 'Login',
          onTap: () {
            loginTap(context, formKey, emailController, passwordController);
          },
          // to make button color gradient
          isGradientColor: true,
        );
      },
    );
  }
}

void loginTap(
    BuildContext context, formKey, emailController, passwordController) {
  if (formKey.currentState!.validate()) {
    context.read<AuthCubit>().userLogin(
        email: emailController.text, password: passwordController.text);
    // for create customer payment id
    CustomerPaymentInputModel customerPaymentInputModel =
        CustomerPaymentInputModel(email: emailController.text);
    context.read<AuthCubit>().creatACustomForPayment(customerPaymentInputModel);
    formKey.currentState!.save();
  } else {
    BlocProvider.of<AuthCubit>(context).validateObserver();
  }
}
