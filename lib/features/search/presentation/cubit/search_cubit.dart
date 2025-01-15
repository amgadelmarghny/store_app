import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/search/data/models/search_for_product_parameter.dart';
import 'package:soagmb/features/search/domain/entities/search.dart';
import 'package:soagmb/features/search/domain/usecases/search_for_product_usecase.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchForProductUsecase) : super(SearchInitial());

  final SearchForProductUsecase searchForProductUsecase;

  Search? searchModel;

  Future<void> searchForProducts(
      {required SearchForProductParameter parameter}) async {
    emit(SearchLoadingState());
    Either<Failure, Search> result = await searchForProductUsecase(parameter);
    result.fold((left) {
      emit(SearchFailureState(errMessage: left.errMessage));
    }, (r) {
      searchModel = r;
      emit(SearchSuccessState());
    });
  }
}
