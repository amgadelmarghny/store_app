import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/address/data/models/update_address_parameter.dart';
import 'package:soagmb/features/address/domain/entities/update_address.dart';
import 'package:soagmb/features/address/domain/repositories/base_address_repo.dart';

class UpdateAddressUsecase
    implements BaseUsecase<UpdateAddress, UpdateAddressParameter> {
  final BaseAddressRepo repo;

  UpdateAddressUsecase({required this.repo});
  @override
  Future<Either<Failure, UpdateAddress>> call(
      UpdateAddressParameter parameters) async {
    return await repo.updateAddress(parameters);
  }
}
