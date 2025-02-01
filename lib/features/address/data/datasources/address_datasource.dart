import 'package:dio/dio.dart';
import 'package:soagmb/core/global/errors/error_model.dart';
import 'package:soagmb/core/global/errors/server_exception.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/core/network/remote/dio_helper_for_shop.dart';
import 'package:soagmb/core/network/remote/end_points_url.dart';
import 'package:soagmb/features/address/data/models/add_new_address_parameter.dart';
import 'package:soagmb/features/address/data/models/get_address_model.dart';
import 'package:soagmb/features/address/data/models/new_address_model.dart';
import 'package:soagmb/features/address/data/models/update_address_model.dart';
import 'package:soagmb/features/address/data/models/update_address_parameter.dart';

abstract class BaseAddressDatasource {
  Future<NewAddressModel> addNewAddress(
      {required AddNewAddressParameter parameter});
  Future<GetAddressesModel> getAddresses();
  Future<UpdateAddressModel> updateAddress(
      {required UpdateAddressParameter parameter});
  Future<void> deleteAddress(int id);
}

class AddressDatasource implements BaseAddressDatasource {
  @override
  Future<NewAddressModel> addNewAddress(
      {required AddNewAddressParameter parameter}) async {
    final response = await DioHelper.postData(
        token: CashHelper.getData(key: tokenConst),
        url: addresses,
        data: dataPathImpl(parameter));
    if (response.statusCode == 200) {
      return NewAddressModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<GetAddressesModel> getAddresses() async {
    final Response response = await DioHelper.getData(
        url: addresses, token: CashHelper.getData(key: tokenConst));
    if (response.statusCode == 200) {
      return GetAddressesModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<UpdateAddressModel> updateAddress(
      {required UpdateAddressParameter parameter}) async {
    final response = await DioHelper.putData(
        url: '$addresses/${parameter.addressId}',
        token: CashHelper.getData(key: tokenConst),
        data: dataPathImpl(parameter));
    if (response.statusCode == 200) {
      return UpdateAddressModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  Map<String, String?> dataPathImpl(parameter) {
    return {
      'name': parameter.name,
      'city': parameter.city,
      'region': parameter.region,
      'details': parameter.details,
      'notes': parameter.notes,
      'latitude': parameter.latitude,
      'longitude': parameter.longitude,
    };
  }

  @override
  Future<void> deleteAddress(int id) async {
    final response = await DioHelper.deleteData(
      url: "$addresses/$id",
      token: CashHelper.getData(key: tokenConst),
    );
    if (response.statusCode != 200) {
      throw ServerException(errorModel: response.data);
    }
  }
}
