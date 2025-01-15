import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/features/search/data/models/search_for_product_parameter.dart';
import 'package:soagmb/features/search/domain/entities/search.dart';
import 'package:soagmb/features/search/domain/repositories/base_get_search_for_product_repo.dart';

class SearchForProductUsecase
    implements BaseUsecase<Search, SearchForProductParameter> {
  final BaseSearchForProductRepo baseSearchForProductRepo;

  SearchForProductUsecase({required this.baseSearchForProductRepo});
  @override
  Future<Either<Failure, Search>> call(
      SearchForProductParameter parameter) async {
    return await baseSearchForProductRepo.getSearchForProduct(
        parameter: parameter);
  }
}
