import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/order/domain/entities/order_details.dart';
import 'package:soagmb/features/order/domain/repositories/base_orders_repo.dart';

class GetOrderDetailsUsecase implements BaseUsecase<OrderDetails, int> {
  final BaseOrdersRepo repo;

  GetOrderDetailsUsecase({required this.repo});

  @override
  Future<Either<Failure, OrderDetails>> call(int orderId) async {
    return await repo.getOrderDetails(orderId);
  }
}
