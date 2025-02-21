import 'details.dart';

class Amoun {
  String? total;
  String? currency;
  Details? details;

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'currency': currency,
      'details': details?.toJson(),
    };
  }
}
