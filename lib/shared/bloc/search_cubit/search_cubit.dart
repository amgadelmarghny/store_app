import 'package:bloc/bloc.dart';
import 'package:soagmb/models/search_model.dart';
import 'package:soagmb/shared/network/local/key_const.dart';
import 'package:soagmb/shared/network/local/shared_helper.dart';
import 'package:soagmb/shared/network/remote/dio_helper_for_shop.dart';
import 'package:soagmb/shared/network/remote/end_points_url.dart';
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
