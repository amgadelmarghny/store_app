import 'package:equatable/equatable.dart';

class Complaint extends Equatable {
  final bool status;
  final String message;
  final ComplaintData? complaintData;

  const Complaint({
    required this.status,
    required this.message,
    required this.complaintData,
  });

  @override
  List<Object?> get props => [status, message, complaintData];
}

class ComplaintData extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String messageSend;

  const ComplaintData({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.messageSend,
  });

  @override
  List<Object?> get props => [id, name, email, phoneNumber, messageSend];
}
