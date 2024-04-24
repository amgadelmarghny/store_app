import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:store_2/layout/shop/shop_view.dart';
import 'package:store_2/modules/address/add_new_address/add_address_view.dart';
import 'package:store_2/modules/address/get_address/addresses_view.dart';
import 'package:store_2/modules/address/modify_address/update_address_view.dart';
import 'package:store_2/modules/order/order_item/order_item_view.dart';
import 'package:store_2/modules/order/order_view.dart';
import 'package:store_2/modules/cart/my_cart_view.dart';
import 'package:store_2/modules/category_details/category_details_view.dart';
import 'package:store_2/modules/login/login_view.dart';
import 'package:store_2/modules/on_boarding/on_boarding_view.dart';
import 'package:store_2/modules/product/product_view.dart';
import 'package:store_2/modules/profile/change_password_view.dart';
import 'package:store_2/modules/profile/profile_view.dart';
import 'package:store_2/modules/profile/update_profile_view.dart';
import 'package:store_2/modules/register/register_view.dart';
import 'package:store_2/modules/search/search_view.dart';
import 'package:store_2/shared/bloc/address_cubit/address_cubit.dart';
import 'package:store_2/shared/bloc/app_cubit/app_cubit.dart';
import 'package:store_2/shared/bloc/bloc_observer.dart';
import 'package:store_2/shared/bloc/category_cubit/category_cubit.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/network/local/api_keys.dart';
import 'package:store_2/shared/network/local/key_const.dart';
import 'package:store_2/shared/network/local/shared_helper.dart';
import 'package:store_2/shared/network/remot/dio_helper.dart';
import 'package:store_2/shared/style/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initial();
  await CashHelper.init();
  Stripe.publishableKey = ApiKeys.publishableKey;
  Bloc.observer = MyBlocObserver();
  runApp(const StoreAp());
}

class StoreAp extends StatelessWidget {
  const StoreAp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool? isSharedDark = CashHelper.getData(key: isDarkCONST);
    bool? isBoarding = CashHelper.getData(key: onBoardingCONST);

    log('token : ${CashHelper.getData(key: tOKENCONST)}');

    late Widget widget;
    if (isBoarding != null) {
      if (CashHelper.getData(key: tOKENCONST) != null) {
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
            home: widget,
          );
        },
      ),
    );
  }
}
