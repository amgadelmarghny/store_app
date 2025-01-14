import 'package:equatable/equatable.dart';
import 'package:soagmb/features/checkout/data/models/payment_intent_model/card._model.dart';
import 'package:soagmb/features/checkout/data/models/payment_intent_model/link_model.dart';

class PaymentMethodOptions extends Equatable {
  final CardModel? card;
  final LinkModel? link;

  const PaymentMethodOptions({required this.card, required this.link});

  @override
  List<Object?> get props => [card, link];
}
