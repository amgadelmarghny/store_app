import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/mdules/login/login_view.dart';
import 'package:store_2/mdules/profile/update_profile.dart';
import 'package:store_2/models/user_model/user_model.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/componants/avatar_pic.dart';
import 'package:store_2/shared/componants/textformfield.dart';
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, UpadteProfileView.id);
                },
                child: Text(
                  'Update your profile',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: defaultColor,
                      ),
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
}
