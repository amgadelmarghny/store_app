import 'package:soagmb/features/checkout/domain/entities/ephemeral_key/ephemeral_key.dart';

import 'associated_object_model.dart';

class EphemeralKeyModel extends EphemeralKey {
  const EphemeralKeyModel({
    super.id,
    super.object,
    super.associatedObjectsModel,
    super.created,
    super.expires,
    super.livemode,
    super.secret,
  });

  factory EphemeralKeyModel.fromJson(Map<String, dynamic> json) {
    return EphemeralKeyModel(
      id: json['id'] as String?,
      object: json['object'] as String?,
      associatedObjectsModel: (json['associated_objects'] as List<dynamic>?)
          ?.map(
              (e) => AssociatedObjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: json['created'] as int?,
      expires: json['expires'] as int?,
      livemode: json['livemode'] as bool?,
      secret: json['secret'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'object': object,
        'associated_objects':
            associatedObjectsModel?.map((e) => e.toJson()).toList(),
        'created': created,
        'expires': expires,
        'livemode': livemode,
        'secret': secret,
      };
}
