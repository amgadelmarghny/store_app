import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/presentation/widgets/complaint_container.dart';
import 'package:soagmb/features/shop/presentation/widgets/drawer_item.dart';
import 'package:soagmb/features/shop/presentation/widgets/settings_menu.dart';
import 'package:soagmb/features/shop/presentation/widgets/user_profile.dart';
import 'package:soagmb/models/drawer_item_model.dart';
import 'package:soagmb/features/address/presentation/views/addresses_view.dart';
import 'package:soagmb/features/shop/presentation/views/my_cart_view.dart';
import 'package:soagmb/features/order/presentation/views/order_view.dart';
import 'package:soagmb/shared/bloc/app_cubit/app_cubit.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});
  
  static const List<DrawerItemModel> _drawerList = [
    DrawerItemModel(
      iconData: Icons.shopping_cart_outlined,
      title: 'My Cart',
      routName: MyCartView.id,
      arguments: false,
    ),
    DrawerItemModel(
      iconData: Icons.shopping_cart_outlined,
      title: 'My Orders',
      routName: OrderView.id,
      arguments: false,
    ),
    DrawerItemModel(
      iconData: Icons.location_on_outlined,
      title: 'My Addresses',
      routName: AddressesView.id,
      arguments: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.teal.shade400,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: UserProfile(),
                ),
                SliverList.builder(
                  itemCount: DrawerMenu._drawerList.length,
                  itemBuilder: (context, index) => Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: DrawerItem(
                      drawerItemModel: DrawerMenu._drawerList[index],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      children: [
                        Spacer(),
                        ComplaintContainer(),
                        SettingsMenu(),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
