import 'package:soagmb/features/address/domain/entities/address.dart';

class AddressModel extends Address {
  const AddressModel({
    required super.id,
    required super.name,
    required super.city,
    required super.region,
    required super.details,
    required super.notes,
    required super.latitude,
    required super.longitude,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json['id'],
        name: json['name'],
        city: json['city'],
        region: json['region'],
        details: json['details'],
        notes: json['notes'],
        latitude: json['latitude'],
        longitude: json['longitude'],
      );
}
