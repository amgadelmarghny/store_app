import 'package:flutter/material.dart';
import 'package:soagmb/modules/login/login_view.dart';
import 'package:soagmb/modules/register/widgets/sliver_register_input.dart';
import 'package:soagmb/shared/components/custom_curve_color_ui.dart';
import 'package:soagmb/shared/components/custom_sliver_row_text.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: CurveColorUI(
            headLine: 'Create Your Account',
            subHeadline: 'Creat an account so your can shop',
            subHeadline2: 'form you comfortable home.',
          ),
        ),
        const SliverRegisterInfo(),
        CustomSliverRowText(
          alertSentence: 'Already have account?',
          text: 'Login',
          routeName: LoginView.id,
        ),
      ],
    );
  }
}
