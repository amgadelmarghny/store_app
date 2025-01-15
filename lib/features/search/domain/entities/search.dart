import 'package:equatable/equatable.dart';
import 'package:soagmb/features/search/domain/entities/search_data.dart';

class Search extends Equatable {
  final bool status;
  final String? message;
  final SearchData? searchData;

  const Search({
    required this.status,
    required this.message,
    required this.searchData,
  });

  @override
  List<Object?> get props => [status, message, searchData];
}
