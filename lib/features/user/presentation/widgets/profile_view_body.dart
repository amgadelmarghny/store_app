import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/presentation/widgets/logout_button.dart';
import 'package:soagmb/features/user/presentation/widgets/update_profile_buttons.dart';
import 'package:soagmb/features/user/data/models/user_model.dart';
import 'package:soagmb/features/user/presentation/widgets/profile_text_field_list_view.dart';
import 'package:soagmb/features/shop/presentation/widgets/avatar_pic.dart';

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
            child: UpdateProfileButtons(userModel: userData),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: LogoutButton(),
            ),
          )
        ],
      ),
    );
  }
}
