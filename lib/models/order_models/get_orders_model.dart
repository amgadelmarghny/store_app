class GetOrdersModel {
  final bool status;
  final String? message;
  final GetOrderData? data;

  GetOrdersModel(
      {required this.status, required this.message, required this.data});
  factory GetOrdersModel.fromJson(Map<String, dynamic> json) => GetOrdersModel(
        status: json['status'],
        message: json['sessage'],
        data: json['data'] != null ? GetOrderData.fromJson(json['data']) : null,
      );
}

class GetOrderData {
  List listOfOrders = [];

  GetOrderData.fromJson(Map<String, dynamic> json) {
    json['data'].forEach(
      (element) => listOfOrders.add(
        OrderModel.fromJson(element),
      ),
    );
  }
}

class OrderModel {
  final int id;
  final dynamic total;
  final String dateTime;
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
        dateTime: json['date'],
        status: json['status'],
      );
}
