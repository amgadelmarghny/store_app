part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

final class AddOrderLoading extends OrderState {}

final class AddOrderSuccess extends OrderState {
  final AddOrderModel addOrderModel;

  const AddOrderSuccess({required this.addOrderModel});
}

final class AddOrderFailure extends OrderState {
  final String error;
  const AddOrderFailure({required this.error});
}

//////////////
final class GetOrderLoading extends OrderState {}

final class GetOrderSuccess extends OrderState {
  final GetOrdersModel getOrdersModel;

  const GetOrderSuccess({required this.getOrdersModel});
}

final class GetOrderFailure extends OrderState {
  final String error;
  const GetOrderFailure({required this.error});
}

///////////////////
final class OrderDetailsLoading extends OrderState {}

final class OrderDetailsSuccess extends OrderState {
  final OrderDetailsModel orderDetailsModel;

  const OrderDetailsSuccess({required this.orderDetailsModel});
}

final class OrderDetailsFailure extends OrderState {
  final String error;
  const OrderDetailsFailure({required this.error});
}

///////////////////////
final class CancelOrderLoading extends OrderState {}

final class CancelOrderSuccess extends OrderState {
  final CancelOrderModel cancelOrderModel;

  const CancelOrderSuccess({required this.cancelOrderModel});
}

final class CancelOrderFailure extends OrderState {
  final String error;
  const CancelOrderFailure({required this.error});
}

