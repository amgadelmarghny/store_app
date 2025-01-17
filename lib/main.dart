import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:soagmb/core/global/services/service_locator.dart';
import 'package:soagmb/core/global/style/themes.dart';
import 'package:soagmb/features/shop/presentation/views/shop_view.dart';
import 'package:soagmb/features/shop/presentation/views/add_address_view.dart';
import 'package:soagmb/features/shop/presentation/views/addresses_view.dart';
import 'package:soagmb/features/shop/presentation/views/update_address_view.dart';
import 'package:soagmb/features/shop/presentation/widgets/order_item_view.dart';
import 'package:soagmb/features/shop/presentation/views/order_view.dart';
import 'package:soagmb/features/shop/presentation/views/my_cart_view.dart';
import 'package:soagmb/features/shop/presentation/views/category_details_view.dart';
import 'package:soagmb/features/user/presentation/views/login_view.dart';
import 'package:soagmb/features/shop/presentation/views/on_boarding_view.dart';
import 'package:soagmb/features/shop/presentation/views/product_view.dart';
import 'package:soagmb/features/user/presentation/views/change_password_view.dart';
import 'package:soagmb/features/user/presentation/views/profile_view.dart';
import 'package:soagmb/features/user/presentation/views/update_profile_view.dart';
import 'package:soagmb/features/user/presentation/views/register_view.dart';
import 'package:soagmb/features/search/presentation/views/search_view.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';
import 'package:soagmb/shared/bloc/app_cubit/app_cubit.dart';
import 'package:soagmb/core/network/remote/bloc_observer.dart';
import 'package:soagmb/shared/bloc/category_cubit/category_cubit.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:soagmb/core/network/local/api_keys.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/core/network/remote/dio_helper_for_shop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initial();
  ServiceLocator.init();
  await CashHelper.init();
  Stripe.publishableKey = ApiKeys.publishableKey;
  Bloc.observer = MyBlocObserver();
  runApp(const Soagmb());
}

class Soagmb extends StatelessWidget {
  const Soagmb({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    log('token : ${CashHelper.getData(key: tOKENCONST)}');

    bool? isSharedDark = CashHelper.getData(key: isDarkCONST);
    bool? isBoarding = CashHelper.getData(key: onBoardingCONST);
    late String routeApp;

    if (isBoarding != null) {
      if (CashHelper.getData(key: tOKENCONST) != null) {
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
        BlocProvider(
          create: (context) => ShopCubit()
            ..getHomeData()
            ..getCategories()
            ..getFavoriteProducts()
            ..getProfileInfo()
            ..getCartItems(),
        ),
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider<AddressCubit>(
            create: (context) => AddressCubit()
              ..getAddresses()
              ..getAllOrders()),
      ],
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
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
              AddressesView.id: (BuildContext context) => const AddressesView(),
              OrderView.id: (context) => const OrderView(),
              UpdateAddressView.id: (context) => const UpdateAddressView(),
              OrderItemView.id: (context) => const OrderItemView(),
              ChangePasswordView.id: (context) => const ChangePasswordView()
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
