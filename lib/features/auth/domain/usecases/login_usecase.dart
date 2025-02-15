import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/auth/data/models/login_user_parameter.dart';
import 'package:soagmb/features/auth/domain/entities/login.dart';
import 'package:soagmb/features/auth/domain/repositories/base_auth_repo.dart';

class LoginUsecase extends BaseUsecase<Login, LoginUserParameter> {
  final BaseAuthRepo repository;

  LoginUsecase({required this.repository});

  @override
  Future<Either<Failure, Login>> call(LoginUserParameter parameters) {
    return repository.loginUser(parameters);
  }
}
