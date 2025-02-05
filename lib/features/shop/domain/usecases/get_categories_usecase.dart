import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/shop/domain/entities/categories.dart';
import 'package:soagmb/features/shop/domain/repositories/base_shop_repo.dart';

class GetCategoriesUsecase implements BaseUsecase<Categories, NoParameters> {
  final BaseShopRepo repo;

  GetCategoriesUsecase({required this.repo});

  @override
  Future<Either<Failure, Categories>> call(NoParameters parameters) async {
    return await repo.getCategories();
  }
}
