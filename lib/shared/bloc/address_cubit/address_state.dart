part of 'address_cubit.dart';

sealed class AddressState {}

final class VAlidateState extends AddressState {}

final class AddressInitial extends AddressState {}

final class AddressLoading extends AddressState {}

final class AddressSuccess extends AddressState {
  final NewAddress newAddress;

  AddressSuccess({required this.newAddress});
}

final class AddressFaluir extends AddressState {
  final String error;
  AddressFaluir({required this.error});
}
