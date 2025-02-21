import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:soagmb/generated/l10n.dart';

class TotalCoastListTile extends StatelessWidget {
  const TotalCoastListTile({super.key});

  @override
  Widget build(BuildContext context) {
    String total =
        BlocProvider.of<ShopCubit>(context).cartModel!.data!.total!.toString();
    return ListTile(
      title: Text(S.of(context).total_coast),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text('EGP', style: Theme.of(context).textTheme.titleSmall!),
          Text(
            total,
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
