import 'package:equatable/equatable.dart';

class GetOrders extends Equatable {
  final bool status;
  final String? message;
  final GetOrdersData? data;

  const GetOrders({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [status, message, data];
}

class GetOrdersData extends Equatable {
  final List listOfOrders;

  const GetOrdersData({required this.listOfOrders});

  @override
  List<Object?> get props => [listOfOrders];
}
