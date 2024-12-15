import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/models/search_model.dart';
import 'package:soagmb/modules/search/widgets/search_data_screen.dart';
import 'package:soagmb/shared/bloc/search_cubit/search_cubit.dart';
import 'package:soagmb/shared/components/custom_show_messages.dart';
import 'package:soagmb/shared/components/expanded_initial_screen.dart';
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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Search',
                onChange: (value) {
                  BlocProvider.of<SearchCubit>(context)
                      .searchForProducts(productName: value);
                },
              ),
              if (state is SearchInitial)
                ExpandedInitialScreen(
                  icon: Icons.search,
                  text: 'Search for what you want',
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
