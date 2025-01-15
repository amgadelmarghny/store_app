import 'package:get_it/get_it.dart';
import 'package:soagmb/features/search/data/datasources/search_for_product_data_source.dart';
import 'package:soagmb/features/search/data/repositories/search_for_product_repo.dart';
import 'package:soagmb/features/search/domain/repositories/base_get_search_for_product_repo.dart';
import 'package:soagmb/features/search/domain/usecases/search_for_product_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static init() {
    sl.registerLazySingleton<BaseSearchForProductDataSource>(
        () => SearchForProductDataSource());
    sl.registerLazySingleton<BaseSearchForProductRepo>(
        () => SearchForProductRepo(baseSearchForProductDataSource: sl()));
    sl.registerLazySingleton(
        () => SearchForProductUsecase(baseSearchForProductRepo: sl()));
  }
}
