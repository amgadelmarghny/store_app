part of 'address_cubit.dart';

sealed class AddressState {}

final class ValidateState extends AddressState {}

final class AddressInitial extends AddressState {}

final class AddAddressLoading extends AddressState {}

final class AddAddressSuccess extends AddressState {
  final NewAddressModel newAddressModel;

  AddAddressSuccess({required this.newAddressModel});
}

final class AddAddressFailure extends AddressState {
  final String error;
  AddAddressFailure({required this.error});
}

////////////////////////
final class CheckSetState extends AddressState {}

///////////////////////////////////
final class GetAddressLoading extends AddressState {}

final class GetAddressSuccess extends AddressState {
  final GetAddressesModel getAddressesModel;

  GetAddressSuccess({required this.getAddressesModel});
}

final class GetAddressFailure extends AddressState {
  final String error;
  GetAddressFailure({required this.error});
}

//////////////////////
final class UpdateAddressLoading extends AddressState {}

final class UpdateAddressSuccess extends AddressState {
  final UpdateAddressModel updateAddressModel;

  UpdateAddressSuccess({required this.updateAddressModel});
}

final class UpdateAddressFailure extends AddressState {
  final String error;
  UpdateAddressFailure({required this.error});
}

///////////////
final class DeleteAddressLoading extends AddressState {}

final class DeleteAddressSuccess extends AddressState {}

final class DeleteAddressFailure extends AddressState {
  final String error;
  DeleteAddressFailure({required this.error});
}

/////////////////
final class AddOrderLoading extends AddressState {}

final class AddOrderSuccess extends AddressState {
  final AddOrderModel addOrderModel;

  AddOrderSuccess({required this.addOrderModel});
}

final class AddOrderFailure extends AddressState {
  final String error;
  AddOrderFailure({required this.error});
}

//////////////
final class GetOrderLoading extends AddressState {}

final class GetOrderSuccess extends AddressState {
  final GetOrdersModel getOrdersModel;

  GetOrderSuccess({required this.getOrdersModel});
}

final class GetOrderFailure extends AddressState {
  final String error;
  GetOrderFailure({required this.error});
}

///////////////////
final class OrderDetailsLoading extends AddressState {}

final class OrderDetailsSuccess extends AddressState {
  final OrderDetailsModel orderDetailsModel;

  OrderDetailsSuccess({required this.orderDetailsModel});
}

final class OrderDetailsFailure extends AddressState {
  final String error;
  OrderDetailsFailure({required this.error});
}

///////////////////////
final class CancelOrderLoading extends AddressState {}

final class CancelOrderSuccess extends AddressState {
  final CancelOrderModel cancelOrderModel;

  CancelOrderSuccess({required this.cancelOrderModel});
}

final class CancelOrderFailure extends AddressState {
  final String error;
  CancelOrderFailure({required this.error});
}
