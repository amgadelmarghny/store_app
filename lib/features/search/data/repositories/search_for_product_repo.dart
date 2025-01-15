import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/core/global/errors/server_exception.dart';
import 'package:soagmb/features/search/data/datasources/search_for_product_data_source.dart';
import 'package:soagmb/features/search/data/models/search_for_product_parameter.dart';
import 'package:soagmb/features/search/domain/entities/search.dart';
import 'package:soagmb/features/search/domain/repositories/base_get_search_for_product_repo.dart';

class SearchForProductRepo implements BaseSearchForProductRepo {
  final BaseSearchForProductDataSource baseSearchForProductDataSource;

  SearchForProductRepo({required this.baseSearchForProductDataSource});
  @override
  Future<Either<Failure, Search>> getSearchForProduct(
      {required SearchForProductParameter parameter}) async {
    final response = await baseSearchForProductDataSource.searchForProduct(
        parameter: parameter);
    try {
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }
}
