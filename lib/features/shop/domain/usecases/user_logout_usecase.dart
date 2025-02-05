import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/shop/domain/entities/logout.dart';
import 'package:soagmb/features/shop/domain/repositories/base_shop_repo.dart';

class UserLogoutUsecase implements BaseUsecase<Logout, NoParameters> {
  final BaseShopRepo repo;

  UserLogoutUsecase({required this.repo});

  @override
  Future<Either<Failure, Logout>> call(NoParameters parameters) async {
    return await repo.userLogout();
  }
}
