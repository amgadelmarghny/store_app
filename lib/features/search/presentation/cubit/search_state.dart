part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {}

class SearchFailureState extends SearchState {
  final String errMessage;
  SearchFailureState({required this.errMessage});
}
