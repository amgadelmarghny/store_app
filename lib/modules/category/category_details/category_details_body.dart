import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Sourban/models/category_details_model.dart';
import 'package:Sourban/modules/home/widgets/product_item.dart';
import 'package:Sourban/shared/bloc/category_cubit/category_cubit.dart';
import 'package:Sourban/shared/components/custom_show_messages.dart';
import 'package:Sourban/shared/style/colors.dart';

class CategoryDetailsViewBody extends StatelessWidget {
  const CategoryDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state is CategoryDetailsFaliur) {
          toastShown(
            message: state.errMessage,
            state: ToastState.error,
            context: context,
          );
        }
      },
      builder: (context, state) {
        CategoryDetailsData? categoryDetailsData =
            BlocProvider.of<CategoryCubit>(context)
                .categoryDetailsModel
                ?.categoryDetailsData;
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ConditionalBuilder(
                condition: state is! CategoryDetailsLoading,
                builder: (context) => Expanded(
                  child: ListView.separated(
                    clipBehavior: Clip.none,
                    itemCount: categoryDetailsData!.productModelList!.length,
                    itemBuilder: (context, index) {
                      return ProductItem(
                          isCategory: true,
                          productModel:
                              categoryDetailsData.productModelList![index]);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 25),
                  ),
                ),
                fallback: (context) => Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'lib/assets/images/category product.png',
                          height: 160,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CircularProgressIndicator(
                          color: defaultColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
