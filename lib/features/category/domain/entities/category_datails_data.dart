import 'package:equatable/equatable.dart';
import 'package:soagmb/features/shop/domain/entities/product.dart';

class CategoryDetailsData extends Equatable {
  final int? currentPage;
  final List<Product>? productModelList;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  const CategoryDetailsData(
      {required this.currentPage,
      required this.productModelList,
      required this.firstPageUrl,
      required this.from,
      required this.lastPage,
      required this.lastPageUrl,
      required this.nextPageUrl,
      required this.path,
      required this.perPage,
      required this.prevPageUrl,
      required this.to,
      required this.total});

  @override
  List<Object?> get props => [
        currentPage,
        productModelList,
        firstPageUrl,
        from,
        lastPage,
        lastPageUrl,
        nextPageUrl,
        path,
        perPage,
        prevPageUrl,
        to,
        total
      ];
}
