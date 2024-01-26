import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store_2/mdules/login/login_view.dart';
import 'package:store_2/mdules/on_boarding/boarding_item.dart';
import 'package:store_2/models/boarding_model.dart';
import 'package:store_2/shared/componants/navigation.dart';
import 'package:store_2/shared/cubit/app_cubit.dart';
import 'package:store_2/shared/style/colors.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    List<BoardModel> boardList = [
      BoardModel(
        image: 'lib/assets/images/Sale3.jpg',
        shopeTitle: 'Explore many products',
        shopeSubTitle: ' Sub. title',
      ),
      BoardModel(
        image: 'lib/assets/images/Sale2.jpg',
        shopeTitle: 'Choose and Checkout',
        shopeSubTitle: 'Sub. title',
      ),
      BoardModel(
        image: 'lib/assets/images/Sale1.jpg',
        shopeTitle: 'Title',
        shopeSubTitle: 'Sub. title',
      ),
    ];
    int x = 3;
    bool isLast = false;

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
                itemCount: boardList.length,
                itemBuilder: (context, index) => BoardingBuilder(
                  boardModel: boardList[index],
                ),
                onPageChanged: (index) {
                  BlocProvider.of<AppCubit>(context).pageNum = index;
                  // if () {
                  //   setState(() {
                  //     isLast = true;
                  //   });
                  // } else {
                  //   setState(() {
                  //     isLast = false;
                  //   });
                  // }
                },
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: boardList.length,
                  effect: const ExpandingDotsEffect(
                    expansionFactor: 2,
                    spacing: 7.0,
                    radius: 30,
                    dotWidth: 24.0,
                    dotHeight: 16.0,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 2,
                    dotColor: defaultColor,
                    activeDotColor: defaultColor,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (BlocProvider.of<AppCubit>(context).pageNum ==
                        boardList.length - 1) {
                      navigatorPushAndRemove(context, const LoginView());
                    } else {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.linear);
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
