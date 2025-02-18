import 'package:equatable/equatable.dart';
import 'package:soagmb/features/address/domain/entities/address.dart';

class GetAddresses extends Equatable {
  final bool status;
  final String? message;
  final AddressessListData? data;

  const GetAddresses({
    required this.status,
    required this.message,
    required this.data,
  });
  @override
  List<Object?> get props => [status, message, data];
}

class AddressessListData extends Equatable {
  final int? total;
  final List<Address> addressModelsList;
  const AddressessListData(
      {required this.total, required this.addressModelsList});
  @override
  List<Object?> get props => [total, addressModelsList];
}
