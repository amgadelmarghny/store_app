import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/shop/data/models/user/change_user_password_parameter.dart';
import 'package:soagmb/features/shop/domain/entities/user/change_password.dart';
import 'package:soagmb/features/shop/domain/repositories/base_update_profile_repo.dart';

class ChangeUserPasswordUsecase
    implements BaseUsecase<ChangePassword, ChangeUserPasswordParameter> {
  final BaseUpdateProfileRepo repo;

  ChangeUserPasswordUsecase({required this.repo});

  @override
  Future<Either<Failure, ChangePassword>> call(
      ChangeUserPasswordParameter parameter) async {
    return await repo.changePassword(parameter);
  }
}
