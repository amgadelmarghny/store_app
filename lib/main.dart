import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/mdules/login/login_view.dart';
import 'package:store_2/mdules/on_boarding/on_boarding_view.dart';
import 'package:store_2/mdules/register/register_view.dart';
import 'package:store_2/shared/bloc/app_cupit/app_cubit.dart';
import 'package:store_2/shared/bloc/auth_cubit/auth_cubit.dart';
import 'package:store_2/shared/network/remot/dio_helper.dart';
import 'package:store_2/shared/style/themes.dart';

void main() {
  DioHelper.initial();
  runApp(const StoreAp());
}

class StoreAp extends StatelessWidget {
  const StoreAp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          OnBoardingView.id: (conyext) => const OnBoardingView(),
          LoginView.id: (context) => const LoginView(),
          RegisterView.id: (context) => const RegisterView(),
        },
        theme: ThemeStyle.lightTheme(),
        darkTheme: ThemeStyle.darkTheme(),
        home: BlocProvider(
          create: (context) => AppCubit(),
          child: const OnBoardingView(),
        ),
      ),
    );
  }
}
