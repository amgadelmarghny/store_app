part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();
  @override
  List<Object?> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryDetailsLoading extends CategoryState {}

final class CategoryDetailsSuccess extends CategoryState {}

final class CategoryDetailsFaliur extends CategoryState {
  final String errMessage;
  const CategoryDetailsFaliur({required this.errMessage});
}
