import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/presentation/views/shop_view.dart';
import 'package:soagmb/features/auth/data/models/register_user_parameter.dart';
import 'package:soagmb/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_button.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';
import 'package:soagmb/features/shop/presentation/widgets/navigation.dart';
import 'package:soagmb/features/checkout/data/models/customer_payment_input_model.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/generated/l10n.dart';

class RegisterButtonConsumer extends StatelessWidget {
  const RegisterButtonConsumer({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
    required this.formKey,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is RegisterFailureState) {
          snacKBar(context, state.err);
        }
        if (state is CustomerPatymentFailure) {
          toastShown(
            message: state.errMessage,
            state: ToastState.error,
            context: context,
          );
        }
        if (state is RegisterSuccessState) {
          if (state.registermodel.status) {
            await CashHelper.setData(
                    key: kToken, value: state.registermodel.user!.token)
                .then(
              (value) {
                if (context.mounted) {
                  toastShown(
                    message: state.registermodel.message,
                    state: ToastState.success,
                    context: context,
                  );
                  navigatorPushAndRemove(
                    context,
                    ShopView.id,
                  );
                }
              },
            );
          } else {
            toastShown(
              message: state.registermodel.message,
              state: ToastState.error,
              context: context,
            );
          }
        }
      },
      builder: (context, state) {
        AuthCubit bloc = AuthCubit.get(context);
        return CustomButton(
          text: S.of(context).register,
          dutrationTime: 0,
          isLoading:
              state is RegisterLodingState || state is CustomerPatymentLoding,
          onTap: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              RegisterUserParameter parameter = RegisterUserParameter(
                name: nameController.text,
                email: emailController.text,
                password: passwordController.text,
                phone: phoneController.text,
              );
              // for create customer payment id
              CustomerPaymentInputModel customerPaymentInputModel =
                  CustomerPaymentInputModel(
                      email: emailController.text,
                      name: nameController.text,
                      phone: phoneController.text);
              bloc.createACustomForPayment(customerPaymentInputModel);
              bloc.userRegister(parameter: parameter);
            } else {
              bloc.validateObserver();
            }
          },
          // to make button color gradient
          isGradientColor: true,
        );
      },
    );
  }
}
