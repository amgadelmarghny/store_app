import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/modules/on_boarding/widgets/boarding_item.dart';
import 'package:soagmb/shared/bloc/app_cubit/app_cubit.dart';

class OnBoardingPageViewBuilder extends StatelessWidget {
  const OnBoardingPageViewBuilder({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = BlocProvider.of<AppCubit>(context);

    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      controller: pageController,
      itemCount: appCubit.boardList.length,
      itemBuilder: (context, index) => BoardingItem(
        boardModel: appCubit.boardList[index],
      ),
      onPageChanged: (index) {
        appCubit.pageNum = index;
      },
    );
  }
}
