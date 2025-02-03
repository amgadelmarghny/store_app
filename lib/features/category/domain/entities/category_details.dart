import 'package:equatable/equatable.dart';
import 'package:soagmb/features/category/domain/entities/category_datails_data.dart';

class CategoryDetails extends Equatable {
  final bool status;
  final String message;
  final CategoryDetailsData? categoryDetailsData;

  const CategoryDetails({
    required this.status,
    required this.message,
    required this.categoryDetailsData,
  });

  @override
  List<Object?> get props => [status, message, categoryDetailsData];
}

