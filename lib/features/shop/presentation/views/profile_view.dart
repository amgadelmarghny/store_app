import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:soagmb/features/shop/domain/entities/user/user.dart';
import 'package:soagmb/features/shop/presentation/widgets/profile_view_body.dart';
import 'package:soagmb/core/global/style/colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static String id = 'Profile-Screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (context, state) {
        User? userData = BlocProvider.of<ShopCubit>(context).profileModel!.user;

        return Scaffold(
          appBar: AppBar(),
          body: ConditionalBuilder(
              condition: userData != null,
              builder: (context) {
                return ProfileViewBody(
                  userModel: userData!,
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
