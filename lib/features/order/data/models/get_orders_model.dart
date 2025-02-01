import 'package:soagmb/features/order/data/models/order_model.dart';
import 'package:soagmb/features/order/domain/entities/get_orders.dart';

class GetOrdersModel extends GetOrders {
  const GetOrdersModel({
    required super.status,
    required super.message,
    required super.data,
  });
  factory GetOrdersModel.fromJson(Map<String, dynamic> json) => GetOrdersModel(
        status: json['status'],
        message: json['sessage'],
        data: json['data'] != null
            ? GetOrderDataModel.fromJson(json['data'])
            : null,
      );
}

class GetOrderDataModel extends GetOrdersData {
  const GetOrderDataModel({required super.listOfOrders});
  factory GetOrderDataModel.fromJson(Map<String, dynamic> json) =>
      GetOrderDataModel(
        listOfOrders: List.from(
          (json['data'] as List).map(
            (element) => OrderModel.fromJson(element),
          ),
        ),
      );
}
