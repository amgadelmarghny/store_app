import 'package:equatable/equatable.dart';
import 'package:soagmb/features/checkout/data/models/ephemeral_key_model/associated_object_model.dart';

import 'associated_object.dart';

class EphemeralKey extends Equatable {
  final String? id;
  final String? object;
  final List<AssociatedObjectModel>? associatedObjectsModel;
  final int? created;
  final int? expires;
  final bool? livemode;
  final String? secret;

  const EphemeralKey({
    this.id,
    this.object,
    this.associatedObjectsModel,
    this.created,
    this.expires,
    this.livemode,
    this.secret,
  });

  @override
  List<Object?> get props => [
        id,
        object,
        associatedObjectsModel,
        created,
        expires,
        livemode,
        secret,
      ];
}
