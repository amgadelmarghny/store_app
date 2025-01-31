import 'package:soagmb/features/address/data/models/address_model.dart';
import 'package:soagmb/features/address/domain/entities/update_address.dart';

class UpdateAddressModel extends UpdateAddress {
  const UpdateAddressModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory UpdateAddressModel.fromJson(Map<String, dynamic> json) =>
      UpdateAddressModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? AddressModel.fromJson(json['data']) : null,
      );
}
