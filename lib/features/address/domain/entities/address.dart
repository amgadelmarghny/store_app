import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final int id;
  final dynamic name, city, region, details;
  final String? notes;
  final dynamic latitude, longitude;

  const Address(
      {required this.id,
      required this.name,
      required this.city,
      required this.region,
      required this.details,
      required this.notes,
      required this.latitude,
      required this.longitude});

  @override
  List<Object?> get props =>
      [id, name, city, region, details, notes, latitude, longitude];
}
