import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/order/data/models/add_new_order__parameter.dart';
import 'package:soagmb/features/order/domain/entities/add_new_order.dart';
import 'package:soagmb/features/order/domain/entities/cancel_order.dart';
import 'package:soagmb/features/order/domain/entities/get_orders.dart';
import 'package:soagmb/features/order/domain/entities/order_details.dart';

abstract class BaseOrdersRepo {
  Future<Either<Failure, AddNewOrder>> addNewOrder(
      AddNewOrderParameter parameter);

  Future<Either<Failure, GetOrders>> getOrders();

  Future<Either<Failure, OrderDetails>> getOrderDetails(int id);

  Future<Either<Failure, CancelOrder>> cancelOrder(int id);
}
