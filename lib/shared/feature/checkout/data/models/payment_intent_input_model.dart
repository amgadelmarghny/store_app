class PaymentIntentInputModel {
  final String currency;
  final String amount;

  PaymentIntentInputModel({required this.currency, required this.amount});

  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'amount': amount,
    };
  }
}
