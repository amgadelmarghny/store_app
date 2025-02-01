import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/address/data/models/add_new_address_parameter.dart';
import 'package:soagmb/features/address/domain/entities/new_address.dart';
import 'package:soagmb/features/address/domain/repositories/base_address_repo.dart';

class AddNewAddressUsecase
    implements BaseUsecase<NewAddress, AddNewAddressParameter> {
  final BaseAddressRepo repo;

  AddNewAddressUsecase({required this.repo});
  @override
  Future<Either<Failure, NewAddress>> call(
      AddNewAddressParameter parameters) async {
    return await repo.addNewAddress(parameters);
  }
}
