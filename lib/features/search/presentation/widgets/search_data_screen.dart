import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/search/domain/entities/search.dart';
import 'package:soagmb/features/search/presentation/cubit/search_cubit.dart';
import 'package:soagmb/core/global/widgets/horizontal_product_item.dart';

class SearchDataScreen extends StatelessWidget {
  const SearchDataScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Search? searchModel =
        BlocProvider.of<SearchCubit>(context).searchModel;
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return HorizontalProductItem(
            isSearch: true,
            productModel: searchModel.searchData!.dataModelList[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: searchModel!.searchData!.dataModelList.length,
      ),
    );
  }
}
