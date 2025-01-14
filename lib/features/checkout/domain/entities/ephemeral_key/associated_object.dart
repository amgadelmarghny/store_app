import 'package:equatable/equatable.dart';

class AssociatedObject extends Equatable {
  final String? id;
  final String? type;

  const AssociatedObject({this.id, this.type});

  @override
  List<Object?> get props => [id, type];
}
