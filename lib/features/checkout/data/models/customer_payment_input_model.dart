import 'package:soagmb/features/checkout/domain/entities/customer_payment_input.dart';

class CustomerPaymentInputModel extends CustomerPaymentInput {
  const CustomerPaymentInputModel({
    super.email,
    super.name,
    super.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
    };
  }
}
