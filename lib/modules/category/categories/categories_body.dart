import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/modules/category/categories/widgets/category_large_item_list_view.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:soagmb/shared/components/custom_show_messages.dart';
import 'package:soagmb/shared/style/colors.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {
          if (state is GetCategoriesFailureState) {
            toastShown(
              message: state.errMessage,
              state: ToastState.error,
              context: context,
            );
          }
        },
        builder: (context, state) {
          List categoriesList = BlocProvider.of<ShopCubit>(context)
              .categoryHomeModel!
              .dataCatHome!
              .dataList;
          if (state is GetCategoriesFailureState) {
            return const Center(child: Text('Somthing went wrong'));
          }
          return ConditionalBuilder(
            condition: categoriesList.isNotEmpty,
            builder: (context) {
              return CategoryLargeItemListView(categoriesList: categoriesList);
            },
            fallback: (contex) => const Center(
              child: CircularProgressIndicator(
                color: defaultColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
