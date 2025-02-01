import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/core/global/errors/server_exception.dart';
import 'package:soagmb/features/order/data/datasources/order_datasource.dart';
import 'package:soagmb/features/order/data/models/add_new_order__parameter.dart';
import 'package:soagmb/features/order/domain/entities/add_new_order.dart';
import 'package:soagmb/features/order/domain/entities/cancel_order.dart';
import 'package:soagmb/features/order/domain/entities/get_orders.dart';
import 'package:soagmb/features/order/domain/entities/order_details.dart';
import 'package:soagmb/features/order/domain/repositories/base_orders_repo.dart';

class OrdersRepo implements BaseOrdersRepo {
  final BaseOrderDatasource baseOrderDatasource;

  OrdersRepo({required this.baseOrderDatasource});
  @override
  Future<Either<Failure, AddNewOrder>> addNewOrder(
      AddNewOrderParameter parameter) async {
    final result = await baseOrderDatasource.addNewOrder(parameter);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, CancelOrder>> cancelOrder(int id) async {
    final result = await baseOrderDatasource.cancelOrder(id);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, OrderDetails>> getOrderDetails(int id) async {
    final result = await baseOrderDatasource.getOrderDetails(id);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, GetOrders>> getOrders() async {
    final result = await baseOrderDatasource.getOrders();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }
}
