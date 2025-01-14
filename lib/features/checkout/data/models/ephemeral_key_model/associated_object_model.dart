import 'package:soagmb/features/checkout/domain/entities/ephemeral_key/associated_object.dart';

class AssociatedObjectModel extends AssociatedObject {
  const AssociatedObjectModel({super.id, super.type});

  factory AssociatedObjectModel.fromJson(Map<String, dynamic> json) {
    return AssociatedObjectModel(
      id: json['id'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
      };
}
