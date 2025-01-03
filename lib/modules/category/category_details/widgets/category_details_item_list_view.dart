import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/modules/category/category_details/widgets/category_product_item.dart';
import 'package:soagmb/shared/bloc/category_cubit/category_cubit.dart';

class CategoryDetailsItemListView extends StatelessWidget {
  const CategoryDetailsItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List? productModelList = BlocProvider.of<CategoryCubit>(context)
        .categoryDetailsModel
        ?.categoryDetailsData!
        .productModelList;
    return Expanded(
      child: ListView.separated(
        clipBehavior: Clip.none,
        itemCount: productModelList!.length,
        itemBuilder: (context, index) {
          return CategoryProductItem(
            productModel: productModelList[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 25),
      ),
    );
  }
}
