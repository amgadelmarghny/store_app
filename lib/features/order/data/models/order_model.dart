import 'package:soagmb/features/order/domain/entities/order.dart';

class OrderModel extends Order {
  const OrderModel({
    required super.id,
    required super.total,
    required super.dateTime,
    required super.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'],
        total: json['total'],
        dateTime: json['date'],
        status: json['status'],
      );
}
