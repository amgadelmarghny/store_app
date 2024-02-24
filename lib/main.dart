import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/layout/shop/shop_view.dart';
import 'package:store_2/mdules/login/login_view.dart';
import 'package:store_2/mdules/on_boarding/on_boarding_view.dart';
import 'package:store_2/mdules/register/register_view.dart';
import 'package:store_2/mdules/search/search_view.dart';
import 'package:store_2/shared/bloc/app_cupit/app_cubit.dart';
import 'package:store_2/shared/bloc/bloc_observer.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/network/lockal/key_const.dart';
import 'package:store_2/shared/network/lockal/shared_helper.dart';
import 'package:store_2/shared/network/remot/dio_helper.dart';
import 'package:store_2/shared/style/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initial();
  await CashHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const StoreAp());
}

class StoreAp extends StatelessWidget {
  const StoreAp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool? isSharedDark = CashHelper.getData(key: isDarkCONST);
    String? tokengiven = CashHelper.getData(key: tOKENCONST);
    bool? isBoarding = CashHelper.getData(key: onBoardingCONST);
    Widget widget;
    if (isBoarding != null) {
      if (tokengiven != null) {
        widget = const ShopView();
      } else {
        widget = const LoginView();
      }
    } else {
      widget = const OnBoardingView();
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AppCubit()..britnessChanged(fromCash: isSharedDark),
        ),
        BlocProvider(
          create: (context) => ShopCubit()
            ..getHomeData()
            ..getCategories()
            ..getFavoriteProducts(),
        ),
      ],
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              OnBoardingView.id: (conyext) => const OnBoardingView(),
              LoginView.id: (context) => const LoginView(),
              RegisterView.id: (context) => const RegisterView(),
              ShopView.id: (context) => const ShopView(),
              SearchView.id: (context) => const SearchView(),
            },
            theme: ThemeStyle.lightTheme(),
            darkTheme: ThemeStyle.darkTheme(),
            themeMode: BlocProvider.of<AppCubit>(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: widget,
          );
        },
      ),
    );
  }
}
