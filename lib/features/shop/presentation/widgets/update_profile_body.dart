import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:soagmb/features/shop/data/models/user/update_profile_parameter.dart';
import 'package:soagmb/features/shop/data/models/user/user_model.dart';
import 'package:soagmb/core/global/widgets/custom_button.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';
import 'package:soagmb/features/shop/presentation/widgets/text_form_field.dart';
import 'package:soagmb/core/global/style/colors.dart';
import 'package:soagmb/features/shop/presentation/widgets/update_profile_image.dart';
import 'package:soagmb/generated/l10n.dart';

class UpdateProfileViewBody extends StatefulWidget {
  const UpdateProfileViewBody({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<UpdateProfileViewBody> createState() => _UpdateProfileViewBodyState();
}

class _UpdateProfileViewBodyState extends State<UpdateProfileViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    return BlocConsumer<ShopCubit, ShopStates>(
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
        ShopCubit cubit = ShopCubit.get(context);
        final TextEditingController nameController = TextEditingController();
        final TextEditingController emailController = TextEditingController();
        final TextEditingController phoneController = TextEditingController();
        nameController.text = widget.userModel.name!;
        emailController.text = widget.userModel.email!;
        phoneController.text = widget.userModel.phone!;
        return FadeInUp(
          duration: Duration(milliseconds: 300),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  children: [
                    UpdateProfileImage(
                      image: widget.userModel.image!,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: nameController,
                      hintText: S.of(context).name,
                      textInputType: TextInputType.name,
                      labelText: S.of(context).name,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: emailController,
                      hintText: S.of(context).email,
                      textInputType: TextInputType.emailAddress,
                      labelText: S.of(context).email,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: phoneController,
                      hintText: S.of(context).phone,
                      textInputType: TextInputType.phone,
                      labelText: S.of(context).phone,
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
                      dutrationTime: 0,
                      text: S.of(context).modify,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          UpdateProfileParameter parameter =
                              UpdateProfileParameter(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  image: cubit.image);

                          await cubit.updateUserInfo(parameter: parameter);
                        } else {
                          autovalidateMode = AutovalidateMode.onUserInteraction;
                          setState(() {});
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
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
          ),
        );
      },
    );
  }
}
