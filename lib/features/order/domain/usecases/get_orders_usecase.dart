import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/order/data/repositories/orders_repo.dart';
import 'package:soagmb/features/order/domain/entities/get_orders.dart';

class GetOrdersUsecase implements BaseUsecase<GetOrders, NoParameters> {
  final OrdersRepo repo;

  GetOrdersUsecase({required this.repo});
  @override
  Future<Either<Failure, GetOrders>> call(NoParameters parameters) async {
    return await repo.getOrders();
  }
}
