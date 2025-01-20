part of 'address_cubit.dart';

abstract class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

final class AddressInitial extends AddressState {}

final class ValidateState extends AddressState {}

final class AddAddressLoading extends AddressState {}

final class AddAddressSuccess extends AddressState {
  final NewAddressModel newAddressModel;

  const AddAddressSuccess({required this.newAddressModel});
}

final class AddAddressFailure extends AddressState {
  final String error;
  const AddAddressFailure({required this.error});
}

////////////////////////
final class CheckSetState extends AddressState {}

///////////////////////////////////
final class GetAddressLoading extends AddressState {}

final class GetAddressSuccess extends AddressState {
  final GetAddressesModel getAddressesModel;

  const GetAddressSuccess({required this.getAddressesModel});
}

final class GetAddressFailure extends AddressState {
  final String error;
  const GetAddressFailure({required this.error});
}

//////////////////////
final class UpdateAddressLoading extends AddressState {}

final class UpdateAddressSuccess extends AddressState {
  final UpdateAddressModel updateAddressModel;

  const UpdateAddressSuccess({required this.updateAddressModel});
}

final class UpdateAddressFailure extends AddressState {
  final String error;
  const UpdateAddressFailure({required this.error});
}

///////////////
final class DeleteAddressLoading extends AddressState {}

final class DeleteAddressSuccess extends AddressState {}

final class DeleteAddressFailure extends AddressState {
  final String error;
  const DeleteAddressFailure({required this.error});
}

/////////////////
final class AddOrderLoading extends AddressState {}

final class AddOrderSuccess extends AddressState {
  final AddOrderModel addOrderModel;

  const AddOrderSuccess({required this.addOrderModel});
}

final class AddOrderFailure extends AddressState {
  final String error;
  const AddOrderFailure({required this.error});
}

//////////////
final class GetOrderLoading extends AddressState {}

final class GetOrderSuccess extends AddressState {
  final GetOrdersModel getOrdersModel;

  const GetOrderSuccess({required this.getOrdersModel});
}

final class GetOrderFailure extends AddressState {
  final String error;
  const GetOrderFailure({required this.error});
}

///////////////////
final class OrderDetailsLoading extends AddressState {}

final class OrderDetailsSuccess extends AddressState {
  final OrderDetailsModel orderDetailsModel;

  const OrderDetailsSuccess({required this.orderDetailsModel});
}

final class OrderDetailsFailure extends AddressState {
  final String error;
  const OrderDetailsFailure({required this.error});
}

///////////////////////
final class CancelOrderLoading extends AddressState {}

final class CancelOrderSuccess extends AddressState {
  final CancelOrderModel cancelOrderModel;

  const CancelOrderSuccess({required this.cancelOrderModel});
}

final class CancelOrderFailure extends AddressState {
  final String error;
  const CancelOrderFailure({required this.error});
}
