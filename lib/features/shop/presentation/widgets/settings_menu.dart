import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/services/service_locator.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:soagmb/core/global/cubits/app_cubit/app_cubit.dart';
import 'package:soagmb/features/shop/presentation/views/shop_view.dart';
import 'package:soagmb/features/shop/presentation/widgets/navigation.dart';
import 'package:soagmb/generated/l10n.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) async {
        if (value == 1) {
          await BlocProvider.of<AppCubit>(context).brightnessChanged();
        } else if (value == 2) {
          await BlocProvider.of<AppCubit>(context).languageToggle();
          if (context.mounted) {
            ShopCubit shopCubit = ShopCubit.get(context);
            AddressCubit addressCubit = AddressCubit.get(context);
            shopCubit.cartModel = null;
            shopCubit.categoryHomeModel = null;
            shopCubit.homeModel = null;
            shopCubit.profileModel = null;
            addressCubit.addressModel = null;
            sl<ShopCubit>()
              ..getHomeData()
              ..getCategories()
              ..getFavoriteProducts()
              ..getProfileInfo()
              ..getCartItems();
            sl<AddressCubit>().getAddresses();
            navigatorPushAndRemove(context, ShopView.id);
          }
        } else if (value == 3) {
          await BlocProvider.of<ShopCubit>(context).userLogout();
        }
      },
      child: ListTile(
        leading: Icon(Icons.settings_outlined),
        title: Text(
          S.of(context).settings,
        ),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: ListTile(
            title: Text(
              S.of(context).theme,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            leading: const Icon(Icons.brightness_6_outlined),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: ListTile(
            title: Text(
              S.of(context).language,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            leading: const Icon(Icons.translate_outlined),
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: ListTile(
            title: Text(
              S.of(context).logout,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            leading: const Icon(Icons.power_settings_new),
          ),
        ),
      ],
    );
  }
}
