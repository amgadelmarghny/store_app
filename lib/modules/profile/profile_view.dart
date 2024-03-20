import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/modules/profile/profile_view_body.dart';
import 'package:store_2/models/user_model.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/style/colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static String id = 'Profile-Screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (context, state) {
        UserModel? userData =
            BlocProvider.of<ShopCubit>(context).profileModel.user;

        return Scaffold(
          appBar: AppBar(),
          body: ConditionalBuilder(
              condition: userData != null,
              builder: (context) {
                return ProfileViewBody(
                  userData: userData!,
                );
              },
              fallback: (context) {
                return const CircularProgressIndicator(
                  color: defaultColor,
                );
              }),
        );
      },
    );
  }
}
