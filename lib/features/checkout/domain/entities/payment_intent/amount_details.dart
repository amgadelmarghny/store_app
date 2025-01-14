import 'package:equatable/equatable.dart';
import 'package:soagmb/features/checkout/data/models/payment_intent_model/tip_model.dart';


class AmountDetails extends Equatable {
  final TipModel? tip;

  const AmountDetails({this.tip});

  @override
  List<Object?> get props => [tip];
}
