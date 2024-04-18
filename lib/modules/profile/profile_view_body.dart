import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/modules/login/login_view.dart';
import 'package:store_2/modules/profile/change_password_view.dart';
import 'package:store_2/modules/profile/update_profile_view.dart';
import 'package:store_2/models/user_model.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/components/avatar_pic.dart';
import 'package:store_2/shared/components/textformfield.dart';
import 'package:store_2/shared/style/colors.dart';

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
            hight: 120,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, ChangePasswordView.id,
                      arguments: userData);
                },
                child: Text(
                  'Change your password',
                  style: underLineDecoration(context),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, UpdateProfileView.id,
                      arguments: userData);
                },
                child: Text(
                  'Modify your profile',
                  style: underLineDecoration(context),
                ),
              ),
            ],
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              BlocProvider.of<ShopCubit>(context)
                  .userLogout(context, routName: LoginView.id);
            },
            child: const Text(
              'LOGOUT ?',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle underLineDecoration(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          decoration: TextDecoration.underline,
          decorationColor: defaultColor,
        );
  }
}
