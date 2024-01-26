import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store_2/mdules/on_boarding/boarding_item.dart';
import 'package:store_2/models/boarding_model.dart';
import 'package:store_2/shared/style/colors.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

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
    bool isLast = false;
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
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
                  if (index == boardList.length - 1) {
                    isLast = true;
                  } else {
                    isLast = false;
                  }
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
                  //  const SlideEffect(
                  //   type: SlideType.slideUnder,
                  //   spacing: 7.0,
                  //   radius: 30,
                  //   dotWidth: 24.0,
                  //   dotHeight: 16.0,
                  //   paintStyle: PaintingStyle.stroke,
                  //   strokeWidth: 2,
                  //   dotColor: Colors.grey,
                  //   activeDotColor: defaultColor,
                  // )
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if(isLast = true){


                    }
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.linear);
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
