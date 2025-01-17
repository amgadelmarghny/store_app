import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/services/service_locator.dart';
import 'package:soagmb/features/user/presentation/cubit/auth_cubit.dart';
import 'package:soagmb/features/user/presentation/widgets/update_profile_body.dart';
import 'package:soagmb/features/user/data/models/user_model.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});
  static String id = "Update Profile";
  @override
  Widget build(BuildContext context) {
    UserModel userModel =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return BlocProvider(
      create: (context) => AuthCubit(sl(), sl()),
      child: Scaffold(
        appBar: AppBar(),
        body: UpdateProfileViewBody(userModel: userModel),
      ),
    );
  }
}
