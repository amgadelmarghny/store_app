import 'package:soagmb/features/checkout/domain/entities/payment_intent/link.dart';

class LinkModel extends Link {
  const LinkModel({super.persistentToken});

  factory LinkModel.fromJson(Map<String, dynamic> json) => LinkModel(
        persistentToken: json['persistent_token'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'persistent_token': persistentToken,
      };
}
