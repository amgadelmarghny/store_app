import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/presentation/views/shop_view.dart';
import 'package:soagmb/features/user/data/models/login_user_parameter.dart';
import 'package:soagmb/features/user/presentation/cubit/auth_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_button.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';
import 'package:soagmb/features/shop/presentation/widgets/navigation.dart';
import 'package:soagmb/features/checkout/data/models/customer_payment_input_model.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';

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
            message: 'Some thing went wrong',
            state: ToastState.error,
            context: context,
          );
        }
        if (state is LoginSuccessState) {
          if (state.loginModel.status) {
            await CashHelper.setData(
                key: tOKENCONST, value: state.loginModel.user!.token);
            if (context.mounted) {
              toastShown(
                message: state.loginModel.message,
                state: ToastState.success,
                context: context,
              );
              navigatorPushAndRemove(
                context,
                ShopView.id,
              );
            }
          } else {
            toastShown(
              message: state.loginModel.message,
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
  AuthCubit bloc = AuthCubit.get(context);
  if (formKey.currentState!.validate()) {
    LoginUserParameter parameter = LoginUserParameter(
        email: emailController.text, password: passwordController.text);
    bloc.userLogin(loginParameter: parameter);
    // for create customer payment id
    CustomerPaymentInputModel customerPaymentInputModel =
        CustomerPaymentInputModel(email: emailController.text);
    bloc.createACustomForPayment(customerPaymentInputModel);
    formKey.currentState!.save();
  } else {
    BlocProvider.of<AuthCubit>(context).validateObserver();
  }
}
