import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/modules/address/get_address/addresses_view.dart';
import 'package:store_2/modules/cart/my_cart_view.dart';
import 'package:store_2/modules/login/login_view.dart';
import 'package:store_2/modules/order/order_view.dart';
import 'package:store_2/modules/profile/profile_view.dart';
import 'package:store_2/shared/bloc/app_cubit/app_cubit.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/components/avatar_pic.dart';
import 'package:store_2/shared/network/local/key_const.dart';
import 'package:store_2/shared/network/local/shared_helper.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ProfileView.id);
                  },
                  child: UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(color: Colors.transparent),
                    currentAccountPicture: AvatarPic(
                      image: BlocProvider.of<ShopCubit>(context)
                          .profileModel!
                          .user!
                          .image!,
                    ),
                    accountName: Text(
                      BlocProvider.of<ShopCubit>(context)
                          .profileModel!
                          .user!
                          .name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    accountEmail: Text(
                      BlocProvider.of<ShopCubit>(context)
                          .profileModel!
                          .user!
                          .email!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_cart_outlined),
                  title: const Text('My Cart'),
                  onTap: () {
                    Navigator.pushNamed(context, MyCartView.id);
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
                Divider(
                  color: BlocProvider.of<AppCubit>(context).isDark
                      ? Colors.grey.shade700
                      : Colors.grey.shade400,
                  height: 0,
                  thickness: 1.3,
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_bag_outlined),
                  title: const Text('My Orders'),
                  onTap: () {
                    Navigator.pushNamed(context, OrderView.id);
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
                Divider(
                  color: BlocProvider.of<AppCubit>(context).isDark
                      ? Colors.grey.shade700
                      : Colors.grey.shade400,
                  height: 0,
                  thickness: 1.3,
                ),
                ListTile(
                  leading: const Icon(Icons.location_on_outlined),
                  title: const Text('My Addresses'),
                  onTap: () {
                    Navigator.pushNamed(context, AddressesView.id);
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
                Divider(
                  color: BlocProvider.of<AppCubit>(context).isDark
                      ? Colors.grey.shade700
                      : Colors.grey.shade400,
                  height: 0,
                  thickness: 1.3,
                ),
                const Spacer(),
                PopupMenuButton(
                  onSelected: (value) {
                    if (value == 1) {
                      BlocProvider.of<AppCubit>(context).britnessChanged();
                    } else if (value == 2) {
                    } else if (value == 3) {
                      BlocProvider.of<ShopCubit>(context).userLogout(
                        context,
                        routName: LoginView.id,
                      );
                      CashHelper.deleteCash(key: tOKENCONST);
                    }
                  },
                  child: const ListTile(
                    leading: Icon(Icons.settings_outlined),
                    title: Text(
                      'Settings',
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_down,
                    ),
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: ListTile(
                        title: Text(
                          'Britness (Light , Dark)',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        leading: const Icon(Icons.brightness_6_outlined),
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: ListTile(
                        title: Text(
                          'Language (En , Ar)',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        leading: const Icon(Icons.translate_outlined),
                      ),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: ListTile(
                        title: Text(
                          'Logout',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        leading: const Icon(Icons.power_settings_new),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
