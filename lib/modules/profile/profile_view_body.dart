import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/modules/login/login_view.dart';
import 'package:soagmb/modules/profile/components/modify_profile_buttons.dart';
import 'package:soagmb/models/user_model.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:soagmb/shared/components/avatar_pic.dart';
import 'package:soagmb/shared/components/text_form_field.dart';
import 'package:soagmb/shared/style/themes.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
    required this.userData,
  });

  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    nameController.text = userData.name!;
    emailController.text = userData.email!;
    phoneController.text = userData.phone!;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          AvatarPic(
            height: 120,
            image: userData.image!,
          ),
          const SizedBox(height: 30),
          CustomTextField(
            isFirstDesign: false,
            controller: nameController,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            isFirstDesign: false,
            controller: emailController,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            isFirstDesign: false,
            controller: phoneController,
          ),
          const SizedBox(
            height: 20,
          ),
          ModifyProfileButtons(userData: userData),
          const Spacer(),
          TextButton(
            onPressed: () {
              BlocProvider.of<ShopCubit>(context)
                  .userLogout(context, routName: LoginView.id);
            },
            child:  Text(
              'LOGOUT ?',
              style: TextStyle(
                color: Colors.red,
                fontSize: getResponsiveFontSize(fontSize: 20),
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
