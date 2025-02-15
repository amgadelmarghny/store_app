import 'package:flutter/material.dart';
import 'package:soagmb/features/auth/presentation/views/register_view.dart';
import 'package:soagmb/features/auth/presentation/widgets/sliver_login_input.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_curve_color_ui.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_sliver_row_text.dart';

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
