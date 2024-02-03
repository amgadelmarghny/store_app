import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/mdules/login/login_view.dart';
import 'package:store_2/mdules/on_boarding/boarding_item.dart';
import 'package:store_2/mdules/on_boarding/custom_smooth_page_indecator.dart';
import 'package:store_2/shared/bloc/app_cupit/app_cubit.dart';
import 'package:store_2/shared/componants/navigation.dart';
import 'package:store_2/shared/network/lockal/key_const.dart';
import 'package:store_2/shared/network/lockal/shared_helper.dart';
import 'package:store_2/shared/style/colors.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  static String id = 'OnBoardingView';
  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = BlocProvider.of<AppCubit>(context);
    PageController pageController = PageController();
    void onPressed() async {
      await CashHelper.setData(key: onboarding, value: true).then(
        (value) {
          if (value) {
            navigatorPushAndRemove(context, LoginView.id);
          }
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        actions: [
          TextButton(
            onPressed: onPressed,
            child: const Text(
              'Skip',
              style: TextStyle(color: defaultColor, fontSize: 25),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                itemCount: appCubit.boardList.length,
                itemBuilder: (context, index) => BoardingBuilder(
                  boardModel: appCubit.boardList[index],
                ),
                onPageChanged: (index) {
                  appCubit.pageNum = index;
                },
              ),
            ),
            Row(
              children: [
                customSmoothPageIndicator(pageController, appCubit),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (appCubit.pageNum == appCubit.boardList.length - 1) {
                      onPressed();
                    } else {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.linear,
                      );
                    }
                  },
                  backgroundColor: Colors.teal,
                  child: const Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  
}
