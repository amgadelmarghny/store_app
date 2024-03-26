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

final class GetAddressLoading extends AddressState {}

final class GetAddressSuccess extends AddressState {
  final GetAddressesModel getAddressesModel;

  GetAddressSuccess({required this.getAddressesModel});
}

final class GetAddressFaluir extends AddressState {
  final String error;
  GetAddressFaluir({required this.error});
}
