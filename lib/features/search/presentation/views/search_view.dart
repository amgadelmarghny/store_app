import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/services/service_locator.dart';
import 'package:soagmb/features/search/presentation/cubit/search_cubit.dart';
import 'package:soagmb/features/search/presentation/widgets/search_view_body.dart';
import 'package:soagmb/generated/l10n.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static String id = 'SearchView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => sl(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).search),
        ),
        body: const SearchViewBody(),
      ),
    );
  }
}
