import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place extends Equatable {
  final String id;
  final String name;
  final LatLng location;

  const Place({required this.id, required this.name, required this.location});

  @override
  List<Object?> get props => [id, name, location];
}
