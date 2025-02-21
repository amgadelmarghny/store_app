import 'details.dart';

class Amount {
  final String total;
  final String currency;
  final Details details;

  Amount({
    required this.total,
    required this.currency,
    required this.details,
  });

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'currency': currency,
      'details': details.toJson(),
    };
  }
}
