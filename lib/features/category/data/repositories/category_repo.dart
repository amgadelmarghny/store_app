import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/core/global/errors/server_exception.dart';
import 'package:soagmb/features/category/data/datasources/category_datasource.dart';
import 'package:soagmb/features/category/domain/entities/category_details.dart';
import 'package:soagmb/features/category/domain/repositories/base_category_repo.dart';

class CategoryRepo implements BaseCategoryRepo {
  final BaseCategoryDatasource baseCategoryDatasource;

  CategoryRepo({required this.baseCategoryDatasource});
  @override
  Future<Either<Failure, CategoryDetails>> getCategoryDetails(int id) async {
    final result = await baseCategoryDatasource.getCategoryDetailsById(id);

    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }
}
