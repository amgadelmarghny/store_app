import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/modules/search/search_view_body.dart';
import 'package:store_2/shared/bloc/search_cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static String id = 'SearchView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: const SearchViewBody(),
      ),
    );
  }
}
