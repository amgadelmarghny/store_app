import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/address/domain/repositories/base_address_repo.dart';

class DeleteAddressUsecase implements BaseUsecase<void, int> {
  final BaseAddressRepo repo;

  DeleteAddressUsecase({required this.repo});

  @override
  Future<Either<Failure, void>> call(int id) {
    return repo.deleteAddress(id);
  }
}
