import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/shop/domain/repositories/base_shop_repo.dart';
import 'package:soagmb/features/user/domain/entities/profile.dart';

class GetProfileInfoUsecase implements BaseUsecase<Profile, NoParameters> {
  final BaseShopRepo repo;

  GetProfileInfoUsecase({required this.repo});

  @override
  Future<Either<Failure, Profile>> call(NoParameters parameters) async {
    return await repo.getProfileInfo();
  }
}
