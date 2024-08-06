class CancelOrderModel {
  final bool status;
  final String message;

  CancelOrderModel({required this.status, required this.message});
  factory CancelOrderModel.fromJson(Map<String, dynamic> json) {
    return CancelOrderModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
