part of 'category_cubit.dart';

sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryDetailsLoading extends CategoryState {}

final class CategoryDetailsSuccess extends CategoryState {}

final class CategoryDetailsFaliur extends CategoryState {
  final String message;
  CategoryDetailsFaliur({required this.message});
}
