class GerOrdersModel {
  final bool status;
  final String? message;
  final GetOrderData? data;

  GerOrdersModel(
      {required this.status, required this.message, required this.data});
  factory GerOrdersModel.fromJson(Map<String, dynamic> json) => GerOrdersModel(
        status: json['Status'],
        message: json['Message'],
        data: json['Data'] != null ? GetOrderData.fromJson(json['Data']) : null,
      );
}

class GetOrderData {
  List listOfOrder = [];

  GetOrderData.fromJson(Map<String, dynamic> json) {
    json['data'].forEach(
      (element) => listOfOrder.add(
        OrderModel.fromJson(element),
      ),
    );
  }
}

class OrderModel {
  final int id;
  final dynamic total;
  final DateTime dateTime;
  final String status;

  OrderModel({
    required this.id,
    required this.total,
    required this.dateTime,
    required this.status,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'],
        total: json['total'],
        dateTime: DateTime.parse(json['date']),
        status: json['status'],
      );
}
