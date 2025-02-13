import 'package:soagmb/features/address/domain/entities/update_address.dart';

class UpdateAddressModel extends UpdateAddress {
  const UpdateAddressModel({
    required super.status,
    required super.message,
  });

  factory UpdateAddressModel.fromJson(Map<String, dynamic> json) =>
      UpdateAddressModel(
        status: json['status'],
        message: json['message'],
      );
}
