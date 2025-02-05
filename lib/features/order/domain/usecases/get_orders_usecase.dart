import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/order/domain/entities/get_orders.dart';
import 'package:soagmb/features/order/domain/repositories/base_orders_repo.dart';

class GetOrdersUsecase implements BaseUsecase<GetOrders, NoParameters> {
  final BaseOrdersRepo repo;

  GetOrdersUsecase({required this.repo});
  @override
  Future<Either<Failure, GetOrders>> call(NoParameters parameters) async {
    return await repo.getOrders();
  }
}
