import 'package:soagmb/features/checkout/domain/entities/payment_intent/tip.dart';

class TipModel extends Tip {
  const TipModel();

  factory TipModel.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('Tip.fromJson($json) is not implemented');
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
