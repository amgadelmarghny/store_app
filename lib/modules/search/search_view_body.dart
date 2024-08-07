import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/models/search_model.dart';
import 'package:soagmb/modules/favorite/widgets/favorite_item.dart';
import 'package:soagmb/shared/bloc/search_cubit/search_cubit.dart';
import 'package:soagmb/shared/components/custom_show_messages.dart';
import 'package:soagmb/shared/components/text_form_field.dart';
import 'package:soagmb/shared/style/colors.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        SearchModel? searchModel =
            BlocProvider.of<SearchCubit>(context).searchModel;
        if (state is SearchFailureState) {
          toastShown(
              message: searchModel!.message!,
              state: ToastState.error,
              context: context);
        }
      },
      builder: (context, state) {
        SearchModel? searchModel =
            BlocProvider.of<SearchCubit>(context).searchModel;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomTextField(
                radius: 5,
                hintText: 'Search',
                onChange: (value) {
                  BlocProvider.of<SearchCubit>(context)
                      .searchForProducts(productName: value);
                },
              ),
              if (state is SearchInitial)
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        size: 200,
                        color: defaultColor,
                      ),
                      Text('Search for what you want')
                    ],
                  ),
                ),
              const SizedBox(height: 16),
              if (state is SearchLoadingState)
                const LinearProgressIndicator(
                  color: defaultColor,
                ),
              if (state is SearchSuccessState)
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return FavoriteItem(
                        isSearch: true,
                        productModel: searchModel
                            .favoritesDataModel!.dataModelList[index],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemCount:
                        searchModel!.favoritesDataModel!.dataModelList.length,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
