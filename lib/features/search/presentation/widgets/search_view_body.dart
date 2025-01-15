import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/features/search/data/models/search_for_product_parameter.dart';
import 'package:soagmb/features/search/domain/entities/search.dart';
import 'package:soagmb/features/search/presentation/cubit/search_cubit.dart';
import 'package:soagmb/features/search/presentation/widgets/search_data_screen.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';
import 'package:soagmb/features/shop/presentation/widgets/expanded_initial_screen.dart';
import 'package:soagmb/features/shop/presentation/widgets/text_form_field.dart';
import 'package:soagmb/core/global/style/colors.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        Search? searchModel = BlocProvider.of<SearchCubit>(context).searchModel;
        if (state is SearchFailureState) {
          toastShown(
              message: searchModel!.message!,
              state: ToastState.error,
              context: context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Search',
                onChange: (value) async {
                  SearchForProductParameter parameter =
                      SearchForProductParameter(
                    productName: value,
                    token: CashHelper.getData(key: tOKENCONST),
                  );

                  await BlocProvider.of<SearchCubit>(context)
                      .searchForProducts(parameter: parameter);
                },
              ),
              if (state is SearchInitial)
                Expanded(
                  child: InitialScreen(
                    icon: Icons.search,
                    text: 'Search for what you want',
                  ),
                ),
              const SizedBox(height: 16),
              if (state is SearchLoadingState)
                const LinearProgressIndicator(
                  color: defaultColor,
                ),
              if (state is SearchSuccessState) SearchDataScreen(),
            ],
          ),
        );
      },
    );
  }
}
