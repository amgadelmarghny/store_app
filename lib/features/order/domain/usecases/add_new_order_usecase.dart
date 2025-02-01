import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/order/data/models/add_new_order__parameter.dart';
import 'package:soagmb/features/order/domain/entities/add_new_order.dart';
import 'package:soagmb/features/order/domain/repositories/base_orders_repo.dart';

class AddNewOrderUsecase
    implements BaseUsecase<AddNewOrder, AddNewOrderParameter> {
  final BaseOrdersRepo repo;

  AddNewOrderUsecase({required this.repo});

  @override
  Future<Either<Failure, AddNewOrder>> call(
      AddNewOrderParameter parameters) async {
    return await repo.addNewOrder(parameters);
  }
}
