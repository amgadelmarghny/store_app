import 'package:flutter/material.dart';
import 'package:soagmb/features/auth/presentation/views/register_view.dart';
import 'package:soagmb/features/auth/presentation/widgets/sliver_login_input.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_curve_color_ui.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_sliver_row_text.dart';
import 'package:soagmb/generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CurveColorUI(
            headLine: S.of(context).welcome,
            subHeadline:
                S.of(context).please_login_with_your_personal_information,
          ),
        ),
        const SliverLoginInfo(),
        CustomSliverRowText(
          alertSentence: S.of(context).dont_have_an_account,
          text: S.of(context).register,
          routeName: RegisterView.id,
        )
      ],
    );
  }
}
