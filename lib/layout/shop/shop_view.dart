import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_2/mdules/login/login_view.dart';
import 'package:store_2/mdules/search/search_view.dart';
import 'package:store_2/shared/bloc/app_cupit/app_cubit.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/componants/custom_show_messeges.dart';
import 'package:store_2/shared/componants/navigation.dart';
import 'package:store_2/shared/network/lockal/key_const.dart';
import 'package:store_2/shared/network/lockal/shared_helper.dart';

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
                toastShown(
                  messege: state.logoutModel.message,
                  context: context,
                  state: ToastState.warning,
                );
                await CashHelper.deleteCash(key: tOKENCONST).then(
                    (value) => navigatorPushAndRemove(context, LoginView.id));
              } else {
                toastShown(
                  messege: state.logoutModel.message,
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
                    messege: state.changedFavoriteModel.message,
                    state: ToastState.error,
                    context: context);
              }
            }
          },
          builder: (context, state) {
            ShopCubit shopCubit = BlocProvider.of<ShopCubit>(context);
            List<Widget> draverItems = shopCubit.listMenu(
              context,
              onSelected: (value) {
                if (value == 1) {
                  BlocProvider.of<AppCubit>(context).britnessChanged();
                } else if (value == 2) {
                } else if (value == 3) {
                  BlocProvider.of<ShopCubit>(context).userLogout();
                }
              },
            );
            return ModalProgressHUD(
              inAsyncCall: state is LogoutLoadingState,
              child: Scaffold(
                drawer: Drawer(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: draverItems,
                    ),
                  ),
                ),
                appBar: AppBar(
                  title: const Text('Nori Store'),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SearchView.id);
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ],
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: shopCubit.currentIndex,
                  items: shopCubit.bottomNavBarItems,
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
