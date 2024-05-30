import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Sourban/modules/login/login_view.dart';
import 'package:Sourban/modules/on_boarding/on_baording_view_body.dart';
import 'package:Sourban/shared/components/navigation.dart';
import 'package:Sourban/shared/network/local/key_const.dart';
import 'package:Sourban/shared/network/local/shared_helper.dart';
import 'package:Sourban/shared/style/colors.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  static String id = 'OnBoardingView';
  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
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
              await CashHelper.setData(key: onBoardingCONST, value: true).then(
                (value) {
                  if (value) {
                    navigatorPushAndRemove(context, LoginView.id);
                  }
                },
              );
            },
            child: const Text(
              'Skip',
              style: TextStyle(color: defaultColor, fontSize: 25),
            ),
          ),
        ],
      ),
      body: OnBoardingViewBody(pageController: pageController),
    );
  }
}
