import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/mdules/categories/category_item.dart';
import 'package:store_2/models/catergory_model/catergory_model.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/componants/custom_show_messeges.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});
  @override
  Widget build(BuildContext context) {
    List<DataModel> categoriesList =
        BlocProvider.of<ShopCubit>(context).categoriesList;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {
          if (state is GetCategoriesFailureState) {
            toastShown(
              messege: state.errMessage,
              state: ToastState.error,
              context: context,
            );
          }
        },
        builder: (context, state) {
          if (state is GetCategoriesFailureState) {
            return const Center(child: Text('Somthing went wrong'));
          }
          return ConditionalBuilder(
              condition: categoriesList.isNotEmpty,
              builder: (context) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return CategoryItem(categoryModel: categoriesList[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: categoriesList.length);
              },
              fallback: (contex) => const Center(
                    child: CircularProgressIndicator(),
                  ));
        },
      ),
    );
  }
}
