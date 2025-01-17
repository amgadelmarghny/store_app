import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soagmb/core/global/style/colors.dart';
import 'package:soagmb/core/global/style/themes.dart';
import 'package:soagmb/features/Auth/presentation/views/login_view.dart';
import 'package:soagmb/features/shop/presentation/widgets/navigation.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import '../widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static String id = 'OnBoardingView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await CashHelper.setData(key: onBoardingCONST, value: true);
              if (context.mounted) navigatorPushAndRemove(context, LoginView.id);
            },
            child: Text(
              'Skip',
              style: TextStyle(
                  color: defaultColor,
                  fontSize: getResponsiveFontSize(fontSize: 25)),
            ),
          ),
        ],
      ),
      body: OnBoardingViewBody(),
    );
  }
}
