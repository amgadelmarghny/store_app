part of 'address_cubit.dart';

sealed class AddressState {}

final class AddressInitial extends AddressState {}

final class AddressLoading extends AddressState {}

final class AddressSuccess extends AddressState {}

final class AddressFaluir extends AddressState {
  final String error;
  AddressFaluir({required this.error});
}
