import 'package:equatable/equatable.dart';

class Link extends Equatable {
  final dynamic persistentToken;

  const Link({this.persistentToken});

  @override
  List<Object?> get props => [persistentToken];
}
