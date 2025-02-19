import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:soagmb/core/global/services/service_locator.dart';
import 'package:soagmb/core/global/style/themes.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/core/global/views/my_location_map_view.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:soagmb/features/shop/presentation/views/shop_view.dart';
import 'package:soagmb/features/address/presentation/views/add_address_view.dart';
import 'package:soagmb/features/address/presentation/views/my_addresses_view.dart';
import 'package:soagmb/features/address/presentation/views/update_address_view.dart';
import 'package:soagmb/features/order/presentation/views/order_item_view.dart';
import 'package:soagmb/features/order/presentation/views/my_orders_view.dart';
import 'package:soagmb/features/shop/presentation/views/my_cart_view.dart';
import 'package:soagmb/features/category/presentation/views/category_details_view.dart';
import 'package:soagmb/features/auth/presentation/views/login_view.dart';
import 'package:soagmb/features/shop/presentation/views/on_boarding_view.dart';
import 'package:soagmb/features/shop/presentation/views/product_view.dart';
import 'package:soagmb/features/shop/presentation/views/change_password_view.dart';
import 'package:soagmb/features/shop/presentation/views/profile_view.dart';
import 'package:soagmb/features/shop/presentation/views/update_profile_view.dart';
import 'package:soagmb/features/auth/presentation/views/register_view.dart';
import 'package:soagmb/features/search/presentation/views/search_view.dart';
import 'package:soagmb/core/global/cubits/app_cubit/app_cubit.dart';
import 'package:soagmb/features/category/presentation/category_cubit/category_cubit.dart';
import 'package:soagmb/generated/l10n.dart';

class ConnetedMaterialApp extends StatelessWidget {
  const ConnetedMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool? isSharedDark = CashHelper.getData(key: kIsDark);
    bool? isBoarding = CashHelper.getData(key: kOnBoarding);
    late String routeApp;

    if (isBoarding != null) {
      if (CashHelper.getData(key: kToken) != null) {
        routeApp = ShopView.id;
      } else {
        routeApp = LoginView.id;
      }
    } else {
      routeApp = OnBoardingView.id;
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AppCubit()..brightnessChanged(fromCash: isSharedDark),
        ),
        BlocProvider<AddressCubit>(
            create: (context) => sl<AddressCubit>()
              ..getAddresses()
              ..checkForLocationAcces()),
        BlocProvider<ShopCubit>(
          create: (context) => sl<ShopCubit>()
            ..getHomeData()
            ..getCategories()
            ..getFavoriteProducts()
            ..getProfileInfo()
            ..getCartItems(),
        ),
        BlocProvider<CategoryCubit>(create: (context) => sl()),
      ],
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            routes: {
              OnBoardingView.id: (context) => const OnBoardingView(),
              LoginView.id: (context) => const LoginView(),
              RegisterView.id: (context) => const RegisterView(),
              ShopView.id: (context) => const ShopView(),
              SearchView.id: (context) => const SearchView(),
              ProfileView.id: (context) => const ProfileView(),
              UpdateProfileView.id: (context) => const UpdateProfileView(),
              ProductView.id: (context) => const ProductView(),
              MyCartView.id: (context) => const MyCartView(),
              CategoryDetailsView.id: (context) => const CategoryDetailsView(),
              AddAddressView.id: (BuildContext context) =>
                  const AddAddressView(),
              MyAddressesView.id: (BuildContext context) =>
                  const MyAddressesView(),
              MyOrdersView.id: (context) => const MyOrdersView(),
              UpdateAddressView.id: (context) => const UpdateAddressView(),
              OrderItemView.id: (context) => const OrderItemView(),
              ChangePasswordView.id: (context) => const ChangePasswordView(),
              MyLocationMapView.id: (context) => const MyLocationMapView(),
            },
            theme: ThemeStyle.lightTheme(),
            darkTheme: ThemeStyle.darkTheme(),
            themeMode: BlocProvider.of<AppCubit>(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            initialRoute: routeApp,
          );
        },
      ),
    );
  }
}
