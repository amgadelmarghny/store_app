import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/style/themes.dart';
import 'package:soagmb/features/Auth/presentation/views/login_view.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        BlocProvider.of<ShopCubit>(context)
            .userLogout(context, routName: LoginView.id);
      },
      child: Text(
        'Log out',
        style: TextStyle(
          color: Colors.red,
          fontSize: getResponsiveFontSize(fontSize: 20),
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
        ),
      ),
    );
  }
}
