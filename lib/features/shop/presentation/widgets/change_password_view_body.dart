import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/change_password_text_field.dart';
import 'package:soagmb/features/shop/data/models/user/change_user_password_parameter.dart';
import 'package:soagmb/core/global/widgets/custom_button.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';
import 'package:soagmb/generated/l10n.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidationMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    final TextEditingController currentPasswordController =
        TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    return FadeInUp(
      duration: Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidationMode,
          child: Column(
            children: [
              ChangePasswordField(
                validationMessage: S.of(context).current_password,
                prefixIcon: Icons.lock_outlined,
                hintText: S.of(context).current_password,
                textInputControl: currentPasswordController,
              ),
              const SizedBox(height: 7),
              ChangePasswordField(
                validationMessage: S.of(context).new_password,
                prefixIcon: Icons.key_outlined,
                hintText: S.of(context).new_password,
                textInputControl: newPasswordController,
              ),
              const SizedBox(height: 20),
              BlocConsumer<ShopCubit, ShopStates>(
                listener: (context, state) {
                  if (state is ChangePasswordSuccessState) {
                    if (state.changePasswordModel.status) {
                      toastShown(
                        message: state.changePasswordModel.message,
                        state: ToastState.success,
                        context: context,
                      );
                    } else {
                      toastShown(
                        message: state.changePasswordModel.message,
                        state: ToastState.error,
                        context: context,
                      );
                    }
                  }
                  if (state is ChangePasswordFailureState) {
                    snacKBar(context, state.errMessage);
                  }
                },
                builder: (context, state) {
                  ShopCubit cubit = ShopCubit.get(context);
                  return CustomButton(
                    dutrationTime: 0,
                    text: S.of(context).update_password,
                    isLoading: state is ChangePasswordLoadingState,
                    onTap: () {
                      ChangeUserPasswordParameter parameter =
                          ChangeUserPasswordParameter(
                              currentPassword: currentPasswordController.text,
                              newPassword: newPasswordController.text);
                      updatePasswordOnTap(cubit, parameter, context);
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                dutrationTime: 0,
                text: S.of(context).cancel,
                color: Colors.grey.shade300,
                textColor: Colors.black,
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updatePasswordOnTap(ShopCubit cubit,
      ChangeUserPasswordParameter parameter, BuildContext context) {
    if (formKey.currentState!.validate()) {
      cubit.changeAccPassword(parameter: parameter);
      BlocProvider.of<ShopCubit>(context).getProfileInfo();
    } else {
      autovalidationMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
