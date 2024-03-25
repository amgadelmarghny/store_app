import 'package:store_2/models/address_models/address_model.dart';

class GetAddresses {
  final bool status;
  final String? message;
  final Data? data;

  GetAddresses({
    required this.status,
    required this.message,
    required this.data,
  });
  factory GetAddresses.fromJson(Map<String, dynamic> json) => GetAddresses(
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
