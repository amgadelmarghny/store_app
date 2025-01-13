import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/modules/favorite/widgets/favorite_data_screen.dart';
import 'package:soagmb/shared/bloc/shop_cubit/shop_cubit.dart';
import 'package:soagmb/shared/components/custom_show_messages.dart';
import 'package:soagmb/shared/components/expanded_initial_screen.dart';
import 'package:soagmb/shared/style/colors.dart';

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
        if (BlocProvider.of<ShopCubit>(context)
            .favoritesModel!
            .favoritesDataModel!
            .dataModelList
            .isEmpty) {
          return InitialScreen(
            icon: Icons.favorite,
            text: 'There is no favorites yet',
          );
        } else if (state is GetFavoritesFailureState) {
          return const Center(child: Text('There is an error'));
        }
        return ConditionalBuilder(
          condition: state is! GetFavoritesLoadingState &&
              state is! FavoriteLoadingState &&
              state is! FavoriteSussiccState,
          builder: (context) {
            return FavoriteDataScreen();
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
