class AddressModel {
  final int id;
  final dynamic name, city, region, details;
  final String? notes;
  final dynamic latitude, longitude;

  AddressModel(
      {required this.id,
      required this.name,
      required this.city,
      required this.region,
      required this.details,
      required this.notes,
      required this.latitude,
      required this.longitude});

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
