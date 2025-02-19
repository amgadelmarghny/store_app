import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/style/themes.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:soagmb/generated/l10n.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        BlocProvider.of<ShopCubit>(context)
            .userLogout();
      },
      child: Text(
        S.of(context).logout,
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
