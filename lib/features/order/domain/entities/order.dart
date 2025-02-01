import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final int id;
  final String status;
  final dynamic total;
  final String dateTime;

  const Order({
    required this.id,
    required this.status,
    required this.total,
    required this.dateTime,
  });

  @override
  List<Object?> get props => [id, status, total, dateTime];
}
