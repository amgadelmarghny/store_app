import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/core/global/errors/server_exception.dart';
import 'package:soagmb/features/user/data/datasources/auth_datasource.dart';
import 'package:soagmb/features/user/data/models/login_user_parameter.dart';
import 'package:soagmb/features/user/data/models/register_user_parameter.dart';
import 'package:soagmb/features/user/domain/entities/login.dart';
import 'package:soagmb/features/user/domain/entities/register.dart';
import 'package:soagmb/features/user/domain/repositories/base_auth_repo.dart';

class AuthRepoImplement implements BaseAuthRepo {
  final BaseAuthDatasource baseAuthDatasource;

  AuthRepoImplement({required this.baseAuthDatasource});

  @override
  Future<Either<Failure, Login>> loginUser(
      LoginUserParameter loginParameter) async {
    final result = await baseAuthDatasource.loginUser(loginParameter);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, Register>> registerUser(
      RegisterUserParameter registerParameter) async {
    final result = await baseAuthDatasource.registerUser(registerParameter);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }
}
