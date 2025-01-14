import 'package:soagmb/features/checkout/data/models/payment_intent_model/card._model.dart';
import 'package:soagmb/features/checkout/domain/entities/payment_intent/payment_method_options.dart';

import 'link_model.dart';

class PaymentMethodOptionsModel extends PaymentMethodOptions {
  const PaymentMethodOptionsModel({super.card, super.link});

  factory PaymentMethodOptionsModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodOptionsModel(
      card: json['card'] == null
          ? null
          : CardModel.fromJson(json['card'] as Map<String, dynamic>),
      link: json['link'] == null
          ? null
          : LinkModel.fromJson(json['link'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'card': card?.toJson(),
        'link': link?.toJson(),
      };
}
