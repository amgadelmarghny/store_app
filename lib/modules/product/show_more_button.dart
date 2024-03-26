import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';

class ShowMoreButton extends StatelessWidget {
  const ShowMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<ShopCubit>(context).showMore();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            BlocProvider.of<ShopCubit>(context).isMore
                ? 'Show less'
                : 'Show more',
          ),
          Icon(
            BlocProvider.of<ShopCubit>(context).isMore
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
          ),
        ],
      ),
    );
  }
}
