import 'package:soagmb/features/shop/domain/entities/complaint.dart';

class ComplaintModel extends Complaint {
  const ComplaintModel({
    required super.status,
    required super.message,
    required super.complaintData,
  });

  factory ComplaintModel.fromJson(Map<String, dynamic> json) {
    return ComplaintModel(
        status: json['status'],
        message: json['message'],
        complaintData: json['data'] != null
            ? ComplaintDataModel.fromJson(json['data'])
            : null);
  }
}

class ComplaintDataModel extends ComplaintData {
  const ComplaintDataModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.messageSend,
  });

  factory ComplaintDataModel.fromJson(Map<String, dynamic> json) =>
      ComplaintDataModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phone'],
        messageSend: json['message'],
      );
}
