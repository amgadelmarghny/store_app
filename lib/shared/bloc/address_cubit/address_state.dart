part of 'address_cubit.dart';

sealed class AddressState {}

final class VAlidateState extends AddressState {}

final class AddressInitial extends AddressState {}

final class AddressLoading extends AddressState {}

final class AddressSuccess extends AddressState {
  final NewAddressModel newAddressModel;

  AddressSuccess({required this.newAddressModel});
}

final class AddressFaluir extends AddressState {
  final String error;
  AddressFaluir({required this.error});
}

////////////////////////
final class CheckSetState extends AddressState {}

///////////////////////////////////
final class GetAddressLoading extends AddressState {}

final class GetAddressSuccess extends AddressState {
  final GetAddressesModel getAddressesModel;

  GetAddressSuccess({required this.getAddressesModel});
}

final class GetAddressFaluir extends AddressState {
  final String error;
  GetAddressFaluir({required this.error});
}

//////////////////////
final class UpdateAddressLoading extends AddressState {}

final class UpdateAddressSuccess extends AddressState {
  final UpdateAddressModel updateAddressModel;

  UpdateAddressSuccess({required this.updateAddressModel});
}

final class UpdateAddressFaluir extends AddressState {
  final String error;
  UpdateAddressFaluir({required this.error});
}

///////////////
final class DeleteAddressLoading extends AddressState {}

final class DeleteAddressSuccess extends AddressState {}

final class DeleteAddressFaluir extends AddressState {
  final String error;
  DeleteAddressFaluir({required this.error});
}

/////////////////
final class AddOrderLoading extends AddressState {}

final class AddOrderSuccess extends AddressState {
  final AddOrderModel addOrderModel;

  AddOrderSuccess({required this.addOrderModel});
}

final class AddOrderFaluir extends AddressState {
  final String error;
  AddOrderFaluir({required this.error});
}

//////////////
final class GetOrderLoading extends AddressState {}

final class GetOrderSuccess extends AddressState {
  final GetOrdersModel getOrdersModel;

  GetOrderSuccess({required this.getOrdersModel});
}

final class GetOrderFaluir extends AddressState {
  final String error;
  GetOrderFaluir({required this.error});
}

///////////////////
final class OrderDetailsLoading extends AddressState {}

final class OrderDetailsSuccess extends AddressState {
  final OrderDetailsModel orderDetailsModel;

  OrderDetailsSuccess({required this.orderDetailsModel});
}

final class OrderDetailsFaluir extends AddressState {
  final String error;
  OrderDetailsFaluir({required this.error});
}

///////////////////////
final class CancleOrderLoading extends AddressState {}

final class CancleOrderSuccess extends AddressState {
  final CancleOrderModel cancleOrderModel;

  CancleOrderSuccess({required this.cancleOrderModel});
}

final class CancleOrderFaluir extends AddressState {
  final String error;
  CancleOrderFaluir({required this.error});
}
