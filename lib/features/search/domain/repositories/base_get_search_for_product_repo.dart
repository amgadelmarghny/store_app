import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/search/data/models/search_for_product_parameter.dart';
import 'package:soagmb/features/search/domain/entities/search.dart';

abstract class BaseSearchForProductRepo {
  Future<Either<Failure, Search>> getSearchForProduct(
      {required SearchForProductParameter parameter});
}
