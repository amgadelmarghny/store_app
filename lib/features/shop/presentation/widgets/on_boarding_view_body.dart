import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/auth/presentation/views/login_view.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_smooth_page_indicator.dart';
import 'package:soagmb/features/shop/presentation/widgets/on_boarding_page_view_bilder.dart';
import 'package:soagmb/core/global/app_cubit/app_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/navigation.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: OnBoardingPageViewBuilder(
              pageController: pageController,
            ),
          ),
          Row(
            children: [
              customSmoothPageIndicator(pageController, context),
              const Spacer(),
              FloatingActionButton(
                onPressed: () async {
                  await onPressed(pageController, context);
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

  Future<void> onPressed(
      PageController pageController, BuildContext context) async {
    AppCubit appCubit = BlocProvider.of<AppCubit>(context);

    if (appCubit.pageNum == appCubit.boardList.length - 1) {
      await CashHelper.setData(key: kOnBoarding, value: true);
      if (context.mounted) navigatorPushAndRemove(context, LoginView.id);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.linear,
      );
    }
  }
}
