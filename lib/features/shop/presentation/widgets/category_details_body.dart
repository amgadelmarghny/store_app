import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/presentation/widgets/category_details_data_loading.dart';
import 'package:soagmb/features/shop/presentation/widgets/category_details_item_list_view.dart';
import 'package:soagmb/shared/bloc/category_cubit/category_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';

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
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ConditionalBuilder(
                condition: state is! CategoryDetailsLoading,
                builder: (context) => CategoryDetailsItemListView(),
                fallback: (context) => CategoryDetailsDataLoading(),
              ),
            ],
          ),
        );
      },
    );
  }
}
