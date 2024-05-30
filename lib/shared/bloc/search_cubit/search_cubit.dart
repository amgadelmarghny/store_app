import 'package:bloc/bloc.dart';
import 'package:Sourban/models/search_model.dart';
import 'package:Sourban/shared/network/local/key_const.dart';
import 'package:Sourban/shared/network/local/shared_helper.dart';
import 'package:Sourban/shared/network/remot/dio_helper_for_shop.dart';
import 'package:Sourban/shared/network/remot/end_points_url.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  SearchModel? searchModel;

  void searchForProducts({required String productName}) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: searchForProduct,
      token: CashHelper.getData(key: tOKENCONST),
      data: {"text": productName},
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((e) {
      emit(SearchFailureState(errMessage: e.toString()));
    });
  }
}
