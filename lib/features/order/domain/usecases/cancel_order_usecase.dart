import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/order/domain/entities/cancel_order.dart';
import 'package:soagmb/features/order/domain/repositories/base_orders_repo.dart';

class CancelOrderUsecase implements BaseUsecase<CancelOrder, int> {
  final BaseOrdersRepo repo;

  CancelOrderUsecase({required this.repo});

  @override
  Future<Either<Failure, CancelOrder>> call(int orderId) async {
    return await repo.cancelOrder(orderId);
  }
}
