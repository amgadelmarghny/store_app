import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/core/global/errors/server_exception.dart';
import 'package:soagmb/features/address/data/datasources/address_datasource.dart';
import 'package:soagmb/features/address/data/models/add_new_address_parameter.dart';
import 'package:soagmb/features/address/data/models/update_address_parameter.dart';
import 'package:soagmb/features/address/domain/entities/get_addresses.dart';
import 'package:soagmb/features/address/domain/entities/new_address.dart';
import 'package:soagmb/features/address/domain/entities/update_address.dart';
import 'package:soagmb/features/address/domain/repositories/base_address_repo.dart';

class AddressRepo implements BaseAddressRepo {
  final BaseAddressDatasource baseAddressDatasource;

  AddressRepo({required this.baseAddressDatasource});
  @override
  Future<Either<Failure, NewAddress>> addNewAddress(
      AddNewAddressParameter parameter) async {
    final result =
        await baseAddressDatasource.addNewAddress(parameter: parameter);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, GetAddresses>> getAddressess() async {
    final result = await baseAddressDatasource.getAddresses();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, UpdateAddress>> updateAddress(
      UpdateAddressParameter parameter) async {
    final result =
        await baseAddressDatasource.updateAddress(parameter: parameter);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAddress(int id) async {
    final result = await baseAddressDatasource.deleteAddress(id);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }
}
