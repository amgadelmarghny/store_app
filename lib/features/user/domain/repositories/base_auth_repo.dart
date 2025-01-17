import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/user/data/models/login_user_parameter.dart';
import 'package:soagmb/features/user/data/models/register_user_parameter.dart';
import 'package:soagmb/features/user/domain/entities/login.dart';
import 'package:soagmb/features/user/domain/entities/register.dart';

abstract class BaseAuthRepo {
  Future<Either<Failure, Login>> loginUser(LoginUserParameter parameter);

  Future<Either<Failure, Register>> registerUser(
      RegisterUserParameter parameter);
}
