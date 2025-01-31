import 'package:soagmb/features/address/data/models/address_model.dart';
import 'package:soagmb/features/address/domain/entities/new_address.dart';

class NewAddressModel extends NewAddress {
  const NewAddressModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory NewAddressModel.fromJson(Map<String, dynamic> json) =>
      NewAddressModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? AddressModel.fromJson(json['data']) : null,
      );
}
