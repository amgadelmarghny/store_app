import 'package:flutter/material.dart';
import 'package:soagmb/modules/register/register_view.dart';
import 'package:soagmb/modules/login/widgets/sliver_login_input.dart';
import 'package:soagmb/shared/components/custom_curve_color_ui.dart';
import 'package:soagmb/shared/components/custom_sliver_row_text.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: CurveColorUI(
            headLine: 'Welcome back !',
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
