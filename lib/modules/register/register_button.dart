import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/layout/shop/shop_view.dart';
import 'package:store_2/models/user_model.dart';
import 'package:store_2/shared/bloc/auth_cubit/auth_cubit.dart';
import 'package:store_2/shared/components/custom_buttomt.dart';
import 'package:store_2/shared/components/custom_show_messeges.dart';
import 'package:store_2/shared/components/navigation.dart';
import 'package:store_2/shared/feature/checkout/data/models/customer_payment_input_model.dart';
import 'package:store_2/shared/network/local/key_const.dart';
import 'package:store_2/shared/network/local/shared_helper.dart';

class RegisterButttonConsumer extends StatelessWidget {
  const RegisterButttonConsumer({
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
            messege: 'Some thing went wrong',
            state: ToastState.error,
            context: context,
          );
        }
        if (state is RegisterSuccessState) {
          if (state.registermodel.status) {
            await CashHelper.setData(
                    key: tOKENCONST, value: state.registermodel.data!.token)
                .then(
              (value) {
                toastShown(
                  messege: state.registermodel.message,
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
              messege: state.registermodel.message,
              state: ToastState.error,
              context: context,
            );
          }
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'SIGN UP',
          isLoading:
              state is RegisterLodingState || state is CustomerPatymentLoding,
          onTap: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              UserModel userModel = UserModel(
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
              context
                  .read<AuthCubit>()
                  .creatACustomForPayment(customerPaymentInputModel);
              BlocProvider.of<AuthCubit>(context)
                  .userRegister(userModel: userModel);
            } else {
              BlocProvider.of<AuthCubit>(context).validateObserver();
            }
          },
          // to make button color gradient
          isGradientColor: true,
        );
      },
    );
  }
}
