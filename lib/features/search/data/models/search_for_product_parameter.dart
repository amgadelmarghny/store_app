import 'package:equatable/equatable.dart';

class SearchForProductParameter extends Equatable {
  final String productName, token;

  const SearchForProductParameter(
      {required this.productName, required this.token});

  @override
  List<Object?> get props => [productName, token];
}
