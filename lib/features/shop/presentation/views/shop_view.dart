import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:soagmb/features/search/presentation/views/search_view.dart';
import 'package:soagmb/features/shop/presentation/widgets/drawer.dart';
import 'package:soagmb/features/user/presentation/views/login_view.dart';
import 'package:soagmb/shared/bloc/app_cubit/app_cubit.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';
import 'package:soagmb/features/shop/presentation/widgets/navigation.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/core/global/style/colors.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});
  static String id = 'ShopView';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return BlocConsumer<ShopCubit, ShopStates>(
          listener: (context, state) async {
            if (state is LogoutSuccussState) {
              if (state.logoutModel.status) {
                await CashHelper.deleteCash(key: tokenConst).then((value) {
                  if (context.mounted) {
                    navigatorPushAndRemove(context, LoginView.id);
                    toastShown(
                      message: state.logoutModel.message,
                      context: context,
                      state: ToastState.warning,
                    );
                  }
                });
              } else {
                toastShown(
                  message: state.logoutModel.message,
                  state: ToastState.error,
                  context: context,
                );
              }
            }
            if (state is GetHomeDataFailureState) {
              if (!context.mounted) return;
              snacKBar(context, state.errMessage);
            }
            if (state is FavoriteSussiccState) {
              if (!state.changedFavoriteModel.status) {
                if (!context.mounted) return;
                toastShown(
                    message: state.changedFavoriteModel.message,
                    state: ToastState.error,
                    context: context);
              }
            }
          },
          builder: (context, state) {
            ShopCubit shopCubit = BlocProvider.of<ShopCubit>(context);
            return ModalProgressHUD(
              inAsyncCall: state is LogoutLoadingState,
              child: Scaffold(
                drawer: const DrawerMenu(),
                appBar: AppBar(
                  title: const Text('soagmb'),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SearchView.id);
                      },
                      icon: const Icon(Icons.manage_search),
                    ),
                  ],
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: shopCubit.currentIndex,
                  items: shopCubit.bottomNavBarItems(
                    color: shopCubit.currentIndex == 0
                        ? defaultColor
                        : Colors.grey,
                  ),
                  onTap: (index) {
                    shopCubit.selectIconChange(index);
                  },
                ),
                body: shopCubit.currentBody[shopCubit.currentIndex],
              ),
            );
          },
        );
      },
    );
  }
}
