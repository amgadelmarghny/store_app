import 'package:soagmb/models/address_models/address_model.dart';

class NewAddressModel {
  final bool status;
  final String? message;
  final AddressModel? data;

  NewAddressModel(
      {required this.status, required this.message, required this.data});

  factory NewAddressModel.fromJson(Map<String, dynamic> json) =>
      NewAddressModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? AddressModel.fromJson(json['data']) : null,
      );
}
