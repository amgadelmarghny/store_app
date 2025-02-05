import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/shop/domain/entities/favorites.dart';
import 'package:soagmb/features/shop/domain/repositories/base_shop_repo.dart';

class GetFavoriteProductsUsecase
    implements BaseUsecase<GetFavorites, NoParameters> {
  final BaseShopRepo repo;

  GetFavoriteProductsUsecase({required this.repo});

  @override
  Future<Either<Failure, GetFavorites>> call(NoParameters parameters) async {
    return await repo.getFavoriteProducts();
  }
}
