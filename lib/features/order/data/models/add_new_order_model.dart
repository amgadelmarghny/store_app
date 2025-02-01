import 'package:soagmb/features/order/domain/entities/add_new_order.dart';

class AddNewOrderModel extends AddNewOrder {
  const AddNewOrderModel({
    required super.status,
    required super.message,
  });

  factory AddNewOrderModel.fromJson(Map<String, dynamic> json) {
    return AddNewOrderModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
