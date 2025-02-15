import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:soagmb/features/shop/presentation/widgets/logout_button.dart';
import 'package:soagmb/features/shop/domain/entities/user/user.dart';
import 'package:soagmb/features/shop/presentation/widgets/update_profile_buttons.dart';
import 'package:soagmb/features/shop/presentation/widgets/profile_text_field_list_view.dart';
import 'package:soagmb/features/shop/presentation/widgets/avatar_pic.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
    required this.userModel,
  });

  final User userModel;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AvatarPic(
                height: 120,
                image: userModel.image!,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 30),
            ),
            ProfileTextFieldListView(
              userData: userModel,
            ),
            SliverToBoxAdapter(
              child: UpdateProfileButtons(userModel: userModel),
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
      ),
    );
  }
}
