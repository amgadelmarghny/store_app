import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/modules/login/login_view.dart';
import 'package:soagmb/modules/on_boarding/widgets/boarding_item.dart';
import 'package:soagmb/modules/on_boarding/widgets/custom_smooth_page_indicator.dart';
import 'package:soagmb/shared/bloc/app_cubit/app_cubit.dart';
import 'package:soagmb/shared/components/navigation.dart';
import 'package:soagmb/shared/network/local/key_const.dart';
import 'package:soagmb/shared/network/local/shared_helper.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = BlocProvider.of<AppCubit>(context);
    return Padding(
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
                onPressed: () async {
                  if (appCubit.pageNum == appCubit.boardList.length - 1) {
                    await CashHelper.setData(key: onBoardingCONST, value: true)
                        .then(
                      (value) {
                        if (value) {
                          if (context.mounted) navigatorPushAndRemove(context, LoginView.id);
                        }
                      },
                    );
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
    );
  }
}
