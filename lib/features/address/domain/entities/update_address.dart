import 'package:equatable/equatable.dart';
import 'package:soagmb/features/address/domain/entities/address.dart';

class UpdateAddress extends Equatable {
  final bool status;
  final String message;
  final Address? data;

  const UpdateAddress({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
