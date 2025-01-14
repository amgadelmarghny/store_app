import 'package:soagmb/features/checkout/domain/entities/payment_intent/automatic_payment_methods.dart';

class AutomaticPaymentMethodsModel extends AutomaticPaymentMethods {
  const AutomaticPaymentMethodsModel({super.enabled});

  factory AutomaticPaymentMethodsModel.fromJson(Map<String, dynamic> json) {
    return AutomaticPaymentMethodsModel(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'enabled': enabled,
      };
}
