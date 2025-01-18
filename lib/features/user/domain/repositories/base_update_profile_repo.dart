import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/user/data/models/change_user_password_parameter.dart';
import 'package:soagmb/features/user/data/models/update_profile_parameter.dart';
import 'package:soagmb/features/user/domain/entities/change_password.dart';
import 'package:soagmb/features/user/domain/entities/profile.dart';

abstract class BaseUpdateProfileRepo {
  Future<Either<Failure, Profile>> updateProfile(
      UpdateProfileParameter parameter);

  Future<Either<Failure, ChangePassword>> changePassword(
      ChangeUserPasswordParameter parameter);
}
