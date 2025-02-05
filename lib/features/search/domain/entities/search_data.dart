import 'package:equatable/equatable.dart';
import 'package:soagmb/features/shop/data/models/product_model.dart';

class SearchData extends Equatable {
  final int? currentPage;
  final List<ProductModel> dataModelList;

  const SearchData({
    required this.currentPage,
    required this.dataModelList,
  });
  @override
  List<Object?> get props => [currentPage, dataModelList];
}
