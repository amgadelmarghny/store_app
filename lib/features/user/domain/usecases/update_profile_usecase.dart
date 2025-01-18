import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/user/data/models/update_profile_parameter.dart';
import 'package:soagmb/features/user/domain/entities/profile.dart';
import 'package:soagmb/features/user/domain/repositories/base_update_profile_repo.dart';

class UpdateProfileUsecase
    implements BaseUsecase<Profile, UpdateProfileParameter> {
  final BaseUpdateProfileRepo baseRepo;

  UpdateProfileUsecase({required this.baseRepo});
  @override
  Future<Either<Failure, Profile>> call(
      UpdateProfileParameter parameter) async {
    return await baseRepo.updateProfile(parameter);
  }
}
