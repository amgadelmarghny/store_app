import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/core/global/errors/server_exception.dart';
import 'package:soagmb/features/shop/data/datasources/update_profile_datasorce.dart';
import 'package:soagmb/features/shop/data/models/user/change_user_password_parameter.dart';
import 'package:soagmb/features/shop/data/models/user/update_profile_parameter.dart';
import 'package:soagmb/features/shop/domain/entities/user/change_password.dart';
import 'package:soagmb/features/shop/domain/entities/user/profile.dart';
import 'package:soagmb/features/shop/domain/repositories/base_update_profile_repo.dart';

class UpdateProfileRepoImplement extends BaseUpdateProfileRepo {
  final BaseUpdateProfileDatasorce repo;

  UpdateProfileRepoImplement({required this.repo});

  @override
  Future<Either<Failure, ChangePassword>> changePassword(
      ChangeUserPasswordParameter parameter) async {
    final result = await repo.changeUserPassword(parameter);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, Profile>> updateProfile(
      UpdateProfileParameter parameter) async {
    final result = await repo.updateProfile(parameter);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }
}
