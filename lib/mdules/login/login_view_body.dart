import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/mdules/register/register_view.dart';
import 'package:store_2/shared/bloc/auth_cubit/auth_cubit.dart';
import 'package:store_2/shared/componants/custom_curve_color_ui.dart';
import 'package:store_2/mdules/login/sliver_login_input.dart';
import 'package:store_2/shared/componants/custom_sliver_row_text.dart';
import 'package:store_2/shared/style/colors.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CurveColorUI(
                headLine: 'Welcom back !',
                subHeadline: 'Please login with your personal information.',
                color: defaultColor,
              ),
            ),
            const SliverLoginInfo(),
            CustomSliverRowText(
              alertSentence: 'Don\'t have an account?',
              text: 'Sign Up',
              routeName: RegisterView.id,
            )
          ],
        );
      },
    );
  }
}
