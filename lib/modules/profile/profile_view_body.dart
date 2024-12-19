import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/modules/login/login_view.dart';
import 'package:soagmb/modules/profile/components/modify_profile_buttons.dart';
import 'package:soagmb/models/user_model.dart';
import 'package:soagmb/modules/profile/components/profile_text_field_list_view.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:soagmb/shared/components/avatar_pic.dart';
import 'package:soagmb/shared/style/themes.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
    required this.userData,
  });

  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AvatarPic(
              height: 120,
              image: userData.image!,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
          ProfileTextFieldListView(
            userData: userData,
          ),
          SliverToBoxAdapter(
            child: ModifyProfileButtons(userData: userData),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  BlocProvider.of<ShopCubit>(context)
                      .userLogout(context, routName: LoginView.id);
                },
                child: Text(
                  'LOGOUT ?',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: getResponsiveFontSize(fontSize: 20),
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
