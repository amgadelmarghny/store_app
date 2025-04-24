import 'package:flutter/material.dart';
import 'package:soagmb/core/global/widgets/custom_refresh_page.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/my_cart_view_body.dart';
import 'package:soagmb/generated/l10n.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});
  static const String id = 'my_cart_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).my_cart),
      ),
      body: CustomRefreshPage(
        onRefresh: () async => await ShopCubit.get(context).getCartItems(),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: MyCartViewBody(),
        ),
      ),
    );
  }
}
