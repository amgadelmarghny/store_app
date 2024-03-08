import 'package:bloc/bloc.dart';
import 'package:store_2/models/search_model/search_model.dart';
import 'package:store_2/shared/components/constants.dart';
import 'package:store_2/shared/network/remot/dio_helper.dart';
import 'package:store_2/shared/network/remot/end_points_url.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  SearchModel? searchModel;

  void searchForProducts({required String searchSubject}) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: searchForProduct,
      token: authToken,
      data: {"text": searchSubject},
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((e) {
      emit(SearchFailureState(errMessage: e.toString()));
    });
  }
}
