import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store_2/mdules/login/login_view.dart';
import 'package:store_2/mdules/on_boarding/boarding_item.dart';
import 'package:store_2/shared/bloc/app_cupit/app_cubit.dart';
import 'package:store_2/shared/componants/navigation.dart';
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
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              navigatorPushAndRemove(context, const LoginView());
            },
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
                SmoothPageIndicator(
                  controller: pageController,
                  count: appCubit.boardList.length,
                  effect: const ExpandingDotsEffect(
                    expansionFactor: 2,
                    spacing: 7.0,
                    dotWidth: 20.0,
                    dotHeight: 10.0,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 2,
                    dotColor: Colors.grey,
                    activeDotColor: defaultColor,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (appCubit.pageNum == appCubit.boardList.length - 1) {
                      navigatorPushAndRemove(context, const LoginView());
                    } else {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.linear,
                      );
                    }
                  },
                  backgroundColor: Colors.teal,
                  child: const Icon(Icons.navigate_next),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
