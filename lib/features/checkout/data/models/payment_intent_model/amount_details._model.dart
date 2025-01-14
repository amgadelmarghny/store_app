import 'package:soagmb/features/checkout/domain/entities/payment_intent/amount_details.dart';

import 'tip_model.dart';

class AmountDetailsModel extends AmountDetails {
  const AmountDetailsModel({
    super.tip,
  });

  factory AmountDetailsModel.fromJson(Map<String, dynamic> json) =>
      AmountDetailsModel(
        tip: json['tip'] == null
            ? null
            : TipModel.fromJson(json['tip'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'tip': tip?.toJson(),
      };
}
