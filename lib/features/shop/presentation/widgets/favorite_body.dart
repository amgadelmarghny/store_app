import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/presentation/widgets/favorite_data_screen.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';
import 'package:soagmb/features/shop/presentation/widgets/expanded_initial_screen.dart';
import 'package:soagmb/core/global/style/colors.dart';

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
          condition: state is FavoriteLoadingState,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(
                color: defaultColor,
              ),
            );
          },
          fallback: (context) {
            return FavoriteDataScreen();
          },
        );
      },
    );
  }
}
