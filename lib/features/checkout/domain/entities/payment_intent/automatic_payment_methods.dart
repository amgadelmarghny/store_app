import 'package:equatable/equatable.dart';

class AutomaticPaymentMethods extends Equatable {
  final bool? enabled;

  const AutomaticPaymentMethods({this.enabled});

  @override
  List<Object?> get props => [enabled];
}
