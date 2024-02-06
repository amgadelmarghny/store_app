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
    String? token = CashHelper.getData(key: tOKENCONST);

    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return BlocProvider(
          create: (context) => ShopCubit(),
          child: BlocConsumer<ShopCubit, ShopStates>(
            listener: (context, state) async {
              if (state is LogoutSuccussState) {
                if (state.logoutModel.status) {
                  toastShown(
                    messege: state.logoutModel.message,
                    context: context,
                    state: ToastState.warning,
                  );
                  await CashHelper.deletCash(key: tOKENCONST).then(
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
            },
            builder: (context, state) {
              ShopCubit shopCubit = BlocProvider.of<ShopCubit>(context);
              List<Widget> draverItems =
                  BlocProvider.of<ShopCubit>(context).listMenu(
                context,
                onSelected: (value) {
                  if (value == 1) {
                    BlocProvider.of<AppCubit>(context).britnessChanged();
                  } else if (value == 2) {
                  } else if (value == 3) {
                    BlocProvider.of<ShopCubit>(context).userLogout(
                      token: token!,
                    );
                  }
                },
              );
              return ModalProgressHUD(
                inAsyncCall: state is LogoutLoadingState,
                child: Scaffold(
                  drawer: Drawer(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return draverItems[index];
                        },
                        separatorBuilder: (context, index) =>
                            const Divider(height: 0),
                        itemCount: draverItems.length),
                  ),
                  appBar: AppBar(
                    title: const Text('Noury Store'),
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
          ),
        );
      },
    );
  }
}
