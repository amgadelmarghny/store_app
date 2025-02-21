import 'package:soagmb/features/address/domain/entities/new_address.dart';

class NewAddressModel extends NewAddress {
  const NewAddressModel({
    required super.status,
    required super.message,
  });

  factory NewAddressModel.fromJson(Map<String, dynamic> json) =>
      NewAddressModel(
        status: json['status'],
        message: json['message'],
      );
}
