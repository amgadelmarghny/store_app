import 'package:bloc/bloc.dart';
import 'package:store_2/models/category_details_model.dart';
import 'package:store_2/shared/network/remot/dio_helper.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  late CategoryDetailsModel categoryDetailsModel;

  void getCategoryDetails({required int categoryId}) async {
    emit(CategoryDetailsLoading());
    DioHelper.getData(url: 'categories/$categoryId').then((value) {
      categoryDetailsModel = CategoryDetailsModel.fromJson(value.data);
      emit(CategoryDetailsSuccess());
    }).catchError((err) {
      emit(CategoryDetailsFaliur(message: err.toString()));
    });
  }
}
