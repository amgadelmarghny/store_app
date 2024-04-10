class CancleOrderModel {
  final bool status;
  final String message;

  CancleOrderModel({required this.status, required this.message});
  factory CancleOrderModel.fromJson(Map<String, dynamic> json) {
    return CancleOrderModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
