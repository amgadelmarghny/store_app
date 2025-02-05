import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/change_password_text_field.dart';
import 'package:soagmb/features/user/data/models/change_user_password_parameter.dart';
import 'package:soagmb/features/user/presentation/cubit/auth_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_button.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidationMode,
        child: ListView(
          children: [
            ChangePasswordField(
              validationMessage: 'Current Password',
              prefixIcon: Icons.lock_outlined,
              hintText: "Current Password",
              textInputControl: currentPasswordController,
            ),
            const SizedBox(height: 7),
            ChangePasswordField(
              validationMessage: 'New Password',
              prefixIcon: Icons.key_outlined,
              hintText: "New Password",
              textInputControl: newPasswordController,
            ),
            const SizedBox(height: 20),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (BuildContext context, AuthState state) {
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
                AuthCubit cubit = AuthCubit.get(context);
                return CustomButton(
                  text: 'Update Password',
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
              text: 'Cancel',
              color: Colors.grey.shade300,
              textColor: Colors.black,
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  void updatePasswordOnTap(AuthCubit cubit,
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
