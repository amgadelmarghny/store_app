import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/category/domain/entities/category_details.dart';
import 'package:soagmb/features/category/domain/repositories/base_category_repo.dart';

class GetCategoryDetailsUsecase implements BaseUsecase<CategoryDetails, int> {
  final BaseCategoryRepo repo;

  GetCategoryDetailsUsecase({required this.repo});
  @override
  Future<Either<Failure, CategoryDetails>> call(int parameters) async {
    return await repo.getCategoryDetails(parameters);
  }
}
