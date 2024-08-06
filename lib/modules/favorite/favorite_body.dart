import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Sourban/modules/favorite/widgets/favorite_item.dart';
import 'package:Sourban/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:Sourban/shared/components/custom_show_messages.dart';
import 'package:Sourban/shared/style/colors.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is GetFavoritesFailureState) {
          toastShown(
            message: state.errMessage,
            state: ToastState.error,
            context: context,
          );
        }
      },
      builder: (context, state) {
        ShopCubit shopCubit = BlocProvider.of<ShopCubit>(context);
        if (BlocProvider.of<ShopCubit>(context)
            .favoritesModel!
            .favoritesDataModel!
            .dataModelList
            .isEmpty) {
          return const Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite_border, size: 80, color: defaultColor),
              Text('There is no favorites yet'),
            ],
          ));
        } else if (state is GetFavoritesFailureState) {
          return const Center(child: Text('There is an error'));
        }
        return ConditionalBuilder(
          condition: state is! GetFavoritesLoadingState &&
              state is! FavoriteLoadingState &&
              state is! FavoriteSussiccState,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return FavoriteItem(
                    productModel: shopCubit.favoritesModel!.favoritesDataModel!
                        .dataModelList[index].productModel!,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: shopCubit
                    .favoritesModel!.favoritesDataModel!.dataModelList.length,
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
