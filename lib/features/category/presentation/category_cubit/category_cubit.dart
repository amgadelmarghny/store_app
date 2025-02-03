import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/category/domain/entities/category_details.dart';
import 'package:soagmb/features/category/domain/usecases/get_category_details_usecase.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.getCategoryDetailsUsecase) : super(CategoryInitial());

  CategoryDetails? categoryDetailsModel;
  int? sameCategoryId;
  final GetCategoryDetailsUsecase getCategoryDetailsUsecase;

  Future getCategoryDetails({required int categoryId}) async {
    // check operator  for if the category is already loaded before
    // so the function will not  load it again
    // and return the details of this category
    if (sameCategoryId == null) {
      sameCategoryId = categoryId;
      emit(CategoryDetailsLoading());
      final result = await getCategoryDetailsUsecase(categoryId);
      return result.fold(
        (l) => emit(CategoryDetailsFaliur(errMessage: l.errMessage)),
        (r) {
          categoryDetailsModel = r;
          emit(CategoryDetailsSuccess());
        },
      );
    } else {
      // when sameCategoryId = value (the value is one of categories
      // that entered before).
      // check if the requested category id is the same u presses on it
      // if wasn't the same then make a request for new category data
      if (sameCategoryId != categoryId) {
        sameCategoryId = categoryId;
        emit(CategoryDetailsLoading());
        final result = await getCategoryDetailsUsecase(categoryId);
        return result.fold(
          (l) => emit(CategoryDetailsFaliur(errMessage: l.errMessage)),
          (r) {
            categoryDetailsModel = r;
            emit(CategoryDetailsSuccess());
          },
        );
      }
    }
  }
}
