import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/address/domain/entities/get_addresses.dart';
import 'package:soagmb/features/address/domain/repositories/base_address_repo.dart';

class GetAddressesUsecase implements BaseUsecase<GetAddresses, NoParameters> {
  final BaseAddressRepo repo;

  GetAddressesUsecase({required this.repo});

  @override
  Future<Either<Failure, GetAddresses>> call(NoParameters parameters) async {
    return await repo.getAddressess();
  }
}
