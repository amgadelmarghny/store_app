import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/widgets/empty_screen.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/features/search/data/models/search_for_product_parameter.dart';
import 'package:soagmb/features/search/presentation/cubit/search_cubit.dart';
import 'package:soagmb/features/search/presentation/widgets/search_data_screen.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';
import 'package:soagmb/features/shop/presentation/widgets/expanded_initial_screen.dart';
import 'package:soagmb/features/shop/presentation/widgets/text_form_field.dart';
import 'package:soagmb/core/global/style/colors.dart';
import 'package:soagmb/generated/l10n.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CustomTextField(
            hintText: S.of(context).search,
            onChange: (value) async {
              SearchForProductParameter parameter = SearchForProductParameter(
                productName: value,
                token: CashHelper.getData(key: kToken),
              );

              await BlocProvider.of<SearchCubit>(context)
                  .searchForProducts(parameter: parameter);
            },
          ),
          const SizedBox(height: 16),
          BlocConsumer<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchInitial) {
                return Expanded(
                  child: InitialScreen(
                    icon: Icons.search,
                    text: S.of(context).search_for_what_you_want,
                  ),
                );
              } else if (state is SearchLoadingState) {
                return const LinearProgressIndicator(
                  color: defaultColor,
                );
              }
              if (state is SearchSuccessState) {
                final productsList = BlocProvider.of<SearchCubit>(context)
                    .searchModel!
                    .searchData!
                    .dataModelList;
                if (productsList.isNotEmpty) {
                  return SearchDataScreen(
                    productsList: productsList,
                  );
                } else {
                  return Expanded(
                    child: EmptyScreen(itemName: S.of(context).products),
                  );
                }
              } else {
                return Expanded(
                    child: Center(
                  child: Icon(
                    Icons.warning_outlined,
                    size: 50,
                  ),
                ));
              }
            },
            listener: (context, state) {
              if (state is SearchFailureState) {
                toastShown(
                    message: BlocProvider.of<SearchCubit>(context)
                        .searchModel!
                        .message!,
                    state: ToastState.error,
                    context: context);
              }
            },
          )
        ],
      ),
    );
  }
}
