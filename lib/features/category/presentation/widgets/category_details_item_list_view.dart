import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/category/presentation/widgets/category_product_item.dart';
import 'package:soagmb/features/category/presentation/category_cubit/category_cubit.dart';
import 'package:soagmb/features/shop/domain/entities/product.dart';

class CategoryDetailsItemListView extends StatelessWidget {
  const CategoryDetailsItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Product>? productModelList = BlocProvider.of<CategoryCubit>(context)
        .categoryDetailsModel
        ?.categoryDetailsData!
        .productModelList;
    if (productModelList != null) {
      return Expanded(
        child: ListView.separated(
          clipBehavior: Clip.none,
          itemCount: productModelList.length,
          itemBuilder: (context, index) {
            return CategoryProductItem(
              productModel: productModelList[index],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 25),
        ),
      );
    } else {
      return Expanded(
        child: Center(
          child: Text('There is no dat \n Please try again'),
        ),
      );
    }
  }
}
