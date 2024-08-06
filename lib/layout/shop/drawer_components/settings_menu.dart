import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Sourban/modules/login/login_view.dart';
import 'package:Sourban/shared/bloc/app_cubit/app_cubit.dart';
import 'package:Sourban/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:Sourban/shared/network/local/key_const.dart';
import 'package:Sourban/shared/network/local/shared_helper.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        if (value == 1) {
          BlocProvider.of<AppCubit>(context).brightnessChanged();
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
    );
  }
}
