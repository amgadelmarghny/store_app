import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/layout/shop/drawer_components/complaint_container.dart';
import 'package:soagmb/layout/shop/drawer_components/settings_menu.dart';
import 'package:soagmb/layout/shop/drawer_components/user_profile.dart';
import 'package:soagmb/modules/address/get_address/addresses_view.dart';
import 'package:soagmb/modules/cart/my_cart_view.dart';
import 'package:soagmb/modules/order/order_view.dart';
import 'package:soagmb/shared/bloc/app_cubit/app_cubit.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.teal.shade400,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserProfile(),
                Expanded(
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.shopping_cart_outlined),
                          title: const Text('My Cart'),
                          onTap: () {
                            Navigator.pushNamed(context, MyCartView.id);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.shopping_bag_outlined),
                          title: const Text('My Orders'),
                          onTap: () {
                            Navigator.pushNamed(context, OrderView.id);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.location_on_outlined),
                          title: const Text('My Addresses'),
                          onTap: () {
                            Navigator.pushNamed(context, AddressesView.id,
                                arguments: true);
                          },
                        ),
                        const Spacer(),
                        const ComplaintContainer(),
                        const SettingsMenu(),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
