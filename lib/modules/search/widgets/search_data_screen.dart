import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/models/search_model.dart';
import 'package:soagmb/modules/favorite/widgets/horizontal_favorite_item.dart';
import 'package:soagmb/shared/bloc/search_cubit/search_cubit.dart';

class SearchDataScreen extends StatelessWidget {
  const SearchDataScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SearchModel? searchModel =
        BlocProvider.of<SearchCubit>(context).searchModel;
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return HorizontalProductItem(
            isSearch: true,
            productModel: searchModel.favoritesDataModel!.dataModelList[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: searchModel!.favoritesDataModel!.dataModelList.length,
      ),
    );
  }
}
