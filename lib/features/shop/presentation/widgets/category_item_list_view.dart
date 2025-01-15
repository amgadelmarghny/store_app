import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/presentation/widgets/category__home_item.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';

class CategoryItemListView extends StatelessWidget {
  const CategoryItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ShopCubit shopCubit = BlocProvider.of<ShopCubit>(context);
    List categoryItemList = shopCubit.categoryHomeModel!.dataCatHome!.dataList;

    return ListView.separated(
      clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(left: 1),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CategoryHomeItem(
          dataModel: categoryItemList[index],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 20,
        );
      },
      itemCount: categoryItemList.length,
    );
  }
}
