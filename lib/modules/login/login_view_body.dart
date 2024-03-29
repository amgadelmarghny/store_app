import 'package:flutter/material.dart';
import 'package:store_2/modules/register/register_view.dart';
import 'package:store_2/modules/login/sliver_login_input.dart';
import 'package:store_2/shared/components/custom_curve_color_ui.dart';
import 'package:store_2/shared/components/custom_sliver_row_text.dart';

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
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: CurveColorUI(
            headLine: 'Welcom back !',
            subHeadline: 'Please login with your personal information.',
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
  }
}
