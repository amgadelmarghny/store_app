import 'package:equatable/equatable.dart';
import 'package:soagmb/features/shop/domain/entities/category.dart';

class Categories extends Equatable {
  final bool status;
  final CategoriesData? catHomeData;

  const Categories({
    required this.status,
    required this.catHomeData,
  });

  @override
  List<Object?> get props => [status, catHomeData];
}

class CategoriesData extends Equatable {
  final int? currentPage;
  final List<Category> dataList;

  const CategoriesData({
    required this.currentPage,
    required this.dataList,
  });

  @override
  List<Object?> get props => [currentPage, dataList];
}
