import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:soagmb/layout/shop/shop_view.dart';
import 'package:soagmb/modules/address/add_new_address/add_address_view.dart';
import 'package:soagmb/modules/address/get_address/addresses_view.dart';
import 'package:soagmb/modules/address/modify_address/update_address_view.dart';
import 'package:soagmb/modules/order/components/order_item/order_item_view.dart';
import 'package:soagmb/modules/order/order_view.dart';
import 'package:soagmb/modules/cart/my_cart_view.dart';
import 'package:soagmb/modules/category/category_details/category_details_view.dart';
import 'package:soagmb/modules/login/login_view.dart';
import 'package:soagmb/modules/on_boarding/on_boarding_view.dart';
import 'package:soagmb/modules/product/product_view.dart';
import 'package:soagmb/modules/profile/change_password_view.dart';
import 'package:soagmb/modules/profile/profile_view.dart';
import 'package:soagmb/modules/profile/update_profile_view.dart';
import 'package:soagmb/modules/register/register_view.dart';
import 'package:soagmb/modules/search/search_view.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';
import 'package:soagmb/shared/bloc/app_cubit/app_cubit.dart';
import 'package:soagmb/shared/bloc/bloc_observer.dart';
import 'package:soagmb/shared/bloc/category_cubit/category_cubit.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:soagmb/shared/network/local/api_keys.dart';
import 'package:soagmb/shared/network/local/key_const.dart';
import 'package:soagmb/shared/network/local/shared_helper.dart';
import 'package:soagmb/shared/network/remote/dio_helper_for_shop.dart';
import 'package:soagmb/shared/style/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initial();
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
              ..getCartItems()
            // ..homeModel
            //..profileModel,
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
