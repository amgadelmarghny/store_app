import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/shop/data/models/user/change_user_password_parameter.dart';
import 'package:soagmb/features/shop/data/models/user/update_profile_parameter.dart';
import 'package:soagmb/features/shop/domain/entities/user/change_password.dart';
import 'package:soagmb/features/shop/domain/entities/user/profile.dart';

abstract class BaseUpdateProfileRepo {
  Future<Either<Failure, Profile>> updateProfile(
      UpdateProfileParameter parameter);

  Future<Either<Failure, ChangePassword>> changePassword(
      ChangeUserPasswordParameter parameter);
}
