part of 'address_cubit.dart';

abstract class AddressState {
  const AddressState();
}

final class AddressInitial extends AddressState {}

final class ValidateState extends AddressState {}

final class AddAddressLoading extends AddressState {}

final class AddAddressSuccess extends AddressState {
  final NewAddress newAddressModel;

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

final class GetAddressSuccess extends AddressState {}

final class GetAddressFailure extends AddressState {
  final String error;
  const GetAddressFailure({required this.error});
}

//////////////////////
final class UpdateAddressLoading extends AddressState {}

final class UpdateAddressSuccess extends AddressState {
  final UpdateAddress updateAddressModel;

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
