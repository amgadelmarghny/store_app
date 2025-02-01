import 'package:soagmb/features/order/domain/entities/cancel_order.dart';

class CancelOrderModel extends CancelOrder {
  const CancelOrderModel({
    required super.status,
    required super.message,
  });

  factory CancelOrderModel.fromJson(Map<String, dynamic> json) {
    return CancelOrderModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
