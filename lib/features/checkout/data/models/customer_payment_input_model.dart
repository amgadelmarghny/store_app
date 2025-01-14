class CustomerPaymentInputModel {
  final String? name;
  final String? phone;
  final String? email;

  CustomerPaymentInputModel({this.name, this.phone, this.email});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
    };
  }
}
