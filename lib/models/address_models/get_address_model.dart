import 'package:Sourban/models/address_models/address_model.dart';

class GetAddressesModel {
  final bool status;
  final String? message;
  final Data? data;

  GetAddressesModel({
    required this.status,
    required this.message,
    required this.data,
  });
  factory GetAddressesModel.fromJson(Map<String, dynamic> json) =>
      GetAddressesModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );
}

class Data {
  int? total;
  List addressModelsList = [];

  Data.fromJson(Map<String, dynamic> json) {
    total = json["total"];
    json['data'].forEach((v) {
      addressModelsList.add(AddressModel.fromJson(v));
    });
  }
}
