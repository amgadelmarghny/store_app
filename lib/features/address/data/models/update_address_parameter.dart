import 'package:equatable/equatable.dart';

class UpdateAddressParameter extends Equatable {
  final int addressId;
  final String name, city, region, details;
  final String? notes, latitude, longitude;

  const UpdateAddressParameter({
    required this.addressId,
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    required this.notes,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props =>
      [addressId, name, city, region, details, notes, latitude, longitude];
}
