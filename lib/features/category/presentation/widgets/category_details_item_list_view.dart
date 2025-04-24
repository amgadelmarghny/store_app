import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/widgets/empty_screen.dart';
import 'package:soagmb/features/category/presentation/widgets/category_product_item.dart';
import 'package:soagmb/features/category/presentation/category_cubit/category_cubit.dart';
import 'package:soagmb/features/shop/domain/entities/product.dart';

class CategoryDetailsItemListView extends StatelessWidget {
  const CategoryDetailsItemListView({
    super.key,
    required this.categoryName,
  });
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    List<Product>? productModelList = BlocProvider.of<CategoryCubit>(context)
        .categoryDetailsModel
        ?.categoryDetailsData!
        .productModelList;
    if (productModelList != null) {
      return ConditionalBuilder(
          condition: productModelList.isNotEmpty,
          builder: (context) => Expanded(
                child: ListView.separated(
                  clipBehavior: Clip.none,
                  itemCount: productModelList.length,
                  itemBuilder: (context, index) {
                    return CategoryProductItem(
                      productModel: productModelList[index],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 25),
                ),
              ),
          fallback: (context) => Expanded(
              child: Center(child: EmptyScreen(itemName: categoryName))));
    } else {
      return Expanded(
        child: Center(
          child: Text('There is no data \n Please try again'),
        ),
      );
    }
  }
}
