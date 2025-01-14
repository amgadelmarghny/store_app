import 'package:equatable/equatable.dart';

class PaymentIntentInput extends Equatable {
  final String currency;
  final String amount;
  final String customerId;

  const PaymentIntentInput({
    required this.customerId,
    required this.currency,
    required this.amount,
  });

  @override
  List<Object?> get props => [
        currency,
        amount,
        customerId,
      ];
}
