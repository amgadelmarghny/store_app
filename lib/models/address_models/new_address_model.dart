import 'package:store_2/models/address_models/address_model.dart';

class NewAddress {
  final String status;
  final String? message;
  final AddressModel? data;

  NewAddress({required this.status, required this.message, required this.data});

  factory NewAddress.fromJson(Map<String, dynamic> json) => NewAddress(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? AddressModel.fromJson(json['data']) : null,
      );
}
