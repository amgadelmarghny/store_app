import 'package:equatable/equatable.dart';

class AddNewAddressParameter extends Equatable {
  final String name;
  final String city;
  final String region;
  final String details;
  final String? notes;
  final String latitude;
  final String longitude;

  const AddNewAddressParameter(
      {required this.name,
      required this.city,
      required this.region,
      required this.details,
      required this.notes,
      required this.latitude,
      required this.longitude});

  @override
  List<Object?> get props =>
      [name, city, region, details, notes, latitude, longitude];
}
