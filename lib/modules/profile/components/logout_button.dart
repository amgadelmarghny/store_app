import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/modules/login/login_view.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:soagmb/shared/style/themes.dart';

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
        'LOGOUT ?',
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
