import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/shop/domain/entities/home.dart';
import 'package:soagmb/features/shop/domain/repositories/base_shop_repo.dart';

class GetHomeDataUsecase implements BaseUsecase<Home, NoParameters> {
  final BaseShopRepo repo;

  GetHomeDataUsecase({required this.repo});

  @override
  Future<Either<Failure, Home>> call(NoParameters parameters) {
    return repo.getHomeData();
  }
}
