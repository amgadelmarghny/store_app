import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/mdules/favorite/favorite_item.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/componants/custom_show_messeges.dart';
import 'package:store_2/shared/style/colors.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is GetFavoritesFailureState) {
          toastShown(
            messege: state.errMessage,
            state: ToastState.error,
            context: context,
          );
        }
      },
      builder: (context, state) {
        ShopCubit shopCubit = BlocProvider.of<ShopCubit>(context);
        if (BlocProvider.of<ShopCubit>(context).dataList.isEmpty) {
          return const Center(child: Text('There is no favorites yet'));
        } else if (state is GetFavoritesFailureState) {
          return const Center(child: Text('There is an error'));
        }
        return ConditionalBuilder(
          condition: state is! GetFavoritesLoadingState,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  print(shopCubit.dataList[index].productModel!.name);
                  return FavoriteItem(
                    productModel: shopCubit.dataList[index].productModel!,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: shopCubit.dataList.length,
              ),
            );
          },
          fallback: (context) {
            return const Center(
              child: CircularProgressIndicator(
                color: defaultColor,
              ),
            );
          },
        );
      },
    );
  }
}
