class AddOrderModel {
  final bool status;
  final String message;
  final Data? data;

  AddOrderModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddOrderModel.fromJson(Map<String, dynamic> json) {
    return AddOrderModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : json['data'],
    );
  }
}

class Data {
  final int id;
  final String paymentMethod;
  final double total;
  final dynamic cost, vat, points, discount;

  Data({
    required this.id,
    required this.paymentMethod,
    required this.total,
    required this.cost,
    required this.vat,
    required this.points,
    required this.discount,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      paymentMethod: json['payment_method'],
      total: json['total'],
      cost: json['cost'],
      vat: json["vat"],
      points: json['points'],
      discount: json['discount'],
    );
  }
}
