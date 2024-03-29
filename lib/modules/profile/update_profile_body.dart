import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/models/user_model.dart';
import 'package:store_2/shared/bloc/auth_cubit/auth_cubit.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/components/constants.dart';
import 'package:store_2/shared/components/custom_buttomt.dart';
import 'package:store_2/shared/components/custom_show_messeges.dart';
import 'package:store_2/shared/components/textformfield.dart';
import 'package:store_2/shared/style/colors.dart';

class UpadteProfileViewBody extends StatelessWidget {
  const UpadteProfileViewBody({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is UpdateProfileSuccessState) {
            if (state.profileModel.status) {
              toastShown(
                messege: state.profileModel.message!,
                state: ToastState.success,
                context: context,
              );
              Navigator.pop(context);
            } else {
              toastShown(
                messege: state.profileModel.message!,
                state: ToastState.error,
                context: context,
              );
            }
          }
          if (state is UpdateProfileFailureState) {
            toastShown(
              messege: state.errMessage,
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
                            authToken: authToken!,
                          )
                              .then((value) {
                            BlocProvider.of<ShopCubit>(context)
                                .getProfileInfo();
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
