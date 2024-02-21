import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/mdules/favorite/favorite_item.dart';
import 'package:store_2/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:store_2/shared/componants/custom_show_messeges.dart';

class FavoriteBody extends StatefulWidget {
  const FavoriteBody({super.key});

  @override
  State<FavoriteBody> createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocConsumer<ShopCubit, ShopStates>(
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

          if (state is GetFavoritesFailureState) {
            return const Center(child: Text('There is an error'));
          } else if (state is GetFavoritesSuccessState) {
            if (shopCubit.dataList.isNotEmpty) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return FavoriteItem(
                      productModel: shopCubit.dataList[index].productModel!,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: shopCubit.dataList.length);
            } else {
              return const Center(child: Text('There is no favorites yet'));
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
