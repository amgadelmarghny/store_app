import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/user/data/models/user_model.dart';
import 'package:soagmb/features/user/presentation/cubit/auth_cubit.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_button.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';
import 'package:soagmb/features/shop/presentation/widgets/text_form_field.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/core/global/style/colors.dart';

class UpdateProfileViewBody extends StatelessWidget {
  const UpdateProfileViewBody({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is UpdateProfileLoadingState) {
            FocusScope.of(context).unfocus();
          }
          if (state is UpdateProfileSuccessState) {
            if (state.profileModel.status) {
              toastShown(
                message: state.profileModel.message!,
                state: ToastState.success,
                context: context,
              );
              Navigator.pop(context);
            } else {
              toastShown(
                message: state.profileModel.message!,
                state: ToastState.error,
                context: context,
              );
            }
          }
          if (state is UpdateProfileFailureState) {
            toastShown(
              message: state.errMessage,
              state: ToastState.error,
              context: context,
            );
          }
        },
        builder: (context, state) {
          final TextEditingController nameController = TextEditingController();
          final TextEditingController emailController = TextEditingController();
          final TextEditingController phoneController = TextEditingController();
          nameController.text = userModel.name!;
          emailController.text = userModel.email!;
          phoneController.text = userModel.phone!;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                autovalidateMode:
                    BlocProvider.of<AuthCubit>(context).autovalidateMode,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.sizeOf(context).height * .15),
                    CustomTextField(
                      controller: nameController,
                      hintText: 'Enter Name',
                      textInputType: TextInputType.name,
                      labelText: "Name",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: emailController,
                      hintText: ' Enter Email',
                      textInputType: TextInputType.emailAddress,
                      labelText: "Email",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: phoneController,
                      hintText: 'Enter Phone Number',
                      textInputType: TextInputType.phone,
                      labelText: 'Phone',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    if (state is UpdateProfileLoadingState)
                      const LinearProgressIndicator(
                        color: defaultColor,
                      ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      text: 'MODIFY',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          BlocProvider.of<AuthCubit>(context)
                              .updateUserInfo(
                            name: nameController.text,
                            email: emailController.text,
                            phoneNumber: phoneController.text,
                            authToken: CashHelper.getData(key: tOKENCONST)!,
                          )
                              .then((value) {
                          if(context.mounted) BlocProvider.of<ShopCubit>(context).getProfileInfo();
                          });
                        } else {
                          BlocProvider.of<AuthCubit>(context)
                              .validateObserver();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
