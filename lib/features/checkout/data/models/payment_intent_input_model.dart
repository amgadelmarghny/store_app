import 'package:soagmb/features/checkout/domain/entities/paument_intent_input.dart';

class PaymentIntentInputModel extends PaymentIntentInput {
  const PaymentIntentInputModel(
      {required super.customerId,
      required super.currency,
      required super.amount});

  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'amount': amount,
      'customer': customerId,
    };
  }
}
