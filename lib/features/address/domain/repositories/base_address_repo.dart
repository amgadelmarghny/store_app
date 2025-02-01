import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/address/data/models/add_new_address_parameter.dart';
import 'package:soagmb/features/address/data/models/update_address_parameter.dart';
import 'package:soagmb/features/address/domain/entities/get_addresses.dart';
import 'package:soagmb/features/address/domain/entities/new_address.dart';
import 'package:soagmb/features/address/domain/entities/update_address.dart';

abstract class BaseAddressRepo {
  Future<Either<Failure, NewAddress>> addNewAddress(
      AddNewAddressParameter parameter);

  Future<Either<Failure, GetAddresses>> getAddressess();

  Future<Either<Failure, UpdateAddress>> updateAddress(
      UpdateAddressParameter parameter);

  Future<Either<Failure, void>> deleteAddress(int id);
}
