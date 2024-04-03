class UpdateAddressModel {
  bool? status;
  String? message;
  UpdateAddressDataModel? data;

  UpdateAddressModel({this.status, this.message, this.data});

  UpdateAddressModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? UpdateAddressDataModel.fromJson(json['data'])
        : null;
  }
}

class UpdateAddressDataModel {
  int? id;
  dynamic name;
  dynamic city;
  dynamic region;
  dynamic details;
  dynamic notes;
  dynamic latitude;
  dynamic longitude;

  UpdateAddressDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    region = json['region'];
    details = json['details'];
    notes = json['notes'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
}
