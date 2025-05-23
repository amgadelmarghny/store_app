import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/presentation/widgets/category_in_home_item.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';

class CategoryHomeItemListView extends StatelessWidget {
  const CategoryHomeItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ShopCubit shopCubit = BlocProvider.of<ShopCubit>(context);
    List categoryItemList = shopCubit.categoryHomeModel!.catHomeData!.dataList;

    return ListView.separated(
      clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(left: 1),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CategoryHomeItem(
          categoryModel: categoryItemList[index],
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
