import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/user/data/models/register_user_parameter.dart';
import 'package:soagmb/features/user/domain/entities/register.dart';
import 'package:soagmb/features/user/domain/repositories/base_auth_repo.dart';

class RegisterUsecase implements BaseUsecase<Register, RegisterUserParameter> {
  final BaseAuthRepo repository;

  RegisterUsecase({required this.repository});
  @override
  Future<Either<Failure, Register>> call(
      RegisterUserParameter parameters) async {
    return await repository.registerUser(parameters);
  }
}
