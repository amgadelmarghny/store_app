import 'package:bloc/bloc.dart';
import 'package:store_2/models/category_details_model.dart';
import 'package:store_2/shared/network/remot/dio_helper.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  CategoryDetailsModel? categoryDetailsModel;
  int? sameCategoryId;

  Future getCategoryDetails({required int categoryId}) async {
    // check operator  for if the categoy is already loaded befor
    // so the function will not  load it again
    // and return the details of this category
    if (sameCategoryId == null) {
      sameCategoryId = categoryId;
      emit(CategoryDetailsLoading());
      return await DioHelper.getData(url: 'categories/$categoryId')
          .then((value) {
        categoryDetailsModel = CategoryDetailsModel.fromJson(value.data);
        emit(CategoryDetailsSuccess());
      }).catchError((err) {
        emit(CategoryDetailsFaliur(errMessage: err.toString()));
      });
    } else {
      // when sameCategoryId = value
      // check if the requested category id is the same u presses on it
      // if wasn't the same then make a request for new category data
      if (sameCategoryId != categoryId) {
        sameCategoryId = categoryId;
        emit(CategoryDetailsLoading());
        return await DioHelper.getData(url: 'categories/$categoryId')
            .then((value) {
          categoryDetailsModel = CategoryDetailsModel.fromJson(value.data);
          emit(CategoryDetailsSuccess());
        }).catchError((err) {
          emit(CategoryDetailsFaliur(errMessage: err.toString()));
        });
      }
    }
  }
}
