import 'package:flutter/material.dart';
import 'package:soagmb/features/auth/presentation/views/login_view.dart';
import 'package:soagmb/features/auth/presentation/widgets/sliver_register_input.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_curve_color_ui.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_sliver_row_text.dart';
import 'package:soagmb/generated/l10n.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CurveColorUI(
            headLine: S.of(context).create_your_account,
            subHeadline: S.of(context).create_an_account_so_you_can_shop,
            subHeadline2: S.of(context).from_ypur_comfortable_home,
          ),
        ),
        const SliverRegisterInfo(),
        CustomSliverRowText(
          alertSentence: S.of(context).already_have_account,
          text: S.of(context).login,
          routeName: LoginView.id,
        ),
      ],
    );
  }
}
