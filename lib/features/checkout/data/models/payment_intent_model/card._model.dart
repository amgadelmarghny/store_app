import 'package:soagmb/features/checkout/domain/entities/payment_intent/card.dart';

class CardModel extends Card {
  const CardModel({
    super.installments,
    super.mandateOptions,
    super.network,
    super.requestThreeDSecure,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        installments: json['installments'] as dynamic,
        mandateOptions: json['mandate_options'] as dynamic,
        network: json['network'] as dynamic,
        requestThreeDSecure: json['request_three_d_secure'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'installments': installments,
        'mandate_options': mandateOptions,
        'network': network,
        'request_three_d_secure': requestThreeDSecure,
      };
}
