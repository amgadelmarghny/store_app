import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/shop/data/models/user/update_profile_parameter.dart';
import 'package:soagmb/features/shop/domain/entities/user/profile.dart';
import 'package:soagmb/features/shop/domain/repositories/base_update_profile_repo.dart';

class UpdateProfileUsecase
    implements BaseUsecase<Profile, UpdateProfileParameter> {
  final BaseUpdateProfileRepo repo;

  UpdateProfileUsecase({required this.repo});

  @override
  Future<Either<Failure, Profile>> call(
      UpdateProfileParameter parameter) async {
    return await repo.updateProfile(parameter);
  }
}
