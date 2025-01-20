class AddOrderModel {
  final bool status;
  final String message;


  AddOrderModel({
    required this.status,
    required this.message,
  });

  factory AddOrderModel.fromJson(Map<String, dynamic> json) {
    return AddOrderModel(
      status: json['status'],
      message: json['message'],
    );
  }
}

