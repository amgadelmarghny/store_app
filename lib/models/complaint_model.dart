class ComplaintModel {
  final bool status;
  final String message;
  final ComplaintDataModel? complaintDataModel;

  ComplaintModel(
      {required this.status,
      required this.message,
      required this.complaintDataModel});

  factory ComplaintModel.fromJson(Map<String, dynamic> json) {
    return ComplaintModel(
        status: json['status'],
        message: json['message'],
        complaintDataModel: json['data'] != null
            ? ComplaintDataModel.fromJson(json['data'])
            : null);
  }
}

class ComplaintDataModel {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String messageSend;

  ComplaintDataModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.messageSend});

  factory ComplaintDataModel.fromJson(Map<String, dynamic> json) =>
      ComplaintDataModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phone'],
        messageSend: json['message'],
      );
}
