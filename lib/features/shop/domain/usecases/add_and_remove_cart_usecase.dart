import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/shop/domain/entities/change_favorite.dart';
import 'package:soagmb/features/shop/domain/repositories/base_shop_repo.dart';

class AddAndRemoveCartUsecase implements BaseUsecase<ChangedFavorite, int> {
  final BaseShopRepo repo;

  AddAndRemoveCartUsecase({required this.repo});

  @override
  Future<Either<Failure, ChangedFavorite>> call(int id) async {
    return await repo.addAndRemoveCart(id);
  }
}
