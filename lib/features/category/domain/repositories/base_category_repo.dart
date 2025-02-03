import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/category/domain/entities/category_details.dart';

abstract class BaseCategoryRepo {
  Future<Either<Failure, CategoryDetails>> getCategoryDetails(int id);
}
