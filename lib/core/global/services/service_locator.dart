import 'package:get_it/get_it.dart';
import 'package:soagmb/features/search/data/datasources/search_for_product_data_source.dart';
import 'package:soagmb/features/search/data/repositories/search_for_product_repo.dart';
import 'package:soagmb/features/search/domain/repositories/base_get_search_for_product_repo.dart';
import 'package:soagmb/features/search/domain/usecases/search_for_product_usecase.dart';
import 'package:soagmb/features/user/data/datasources/auth_datasource.dart';
import 'package:soagmb/features/user/data/repositories/auth_repo_implement.dart';
import 'package:soagmb/features/user/domain/repositories/base_auth_repo.dart';
import 'package:soagmb/features/user/domain/usecases/login_usecase.dart';
import 'package:soagmb/features/user/domain/usecases/register_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static init() {
    
    // Auth
    sl.registerLazySingleton<BaseAuthDatasource>(() => AuthDatasource());
    sl.registerLazySingleton<BaseAuthRepo>(
        () => AuthRepoImplement(baseAuthDatasource: sl()));
    sl.registerLazySingleton(() => RegisterUsecase(repository: sl()));
    sl.registerLazySingleton(() => LoginUsecase(repository: sl()));

    // search
    sl.registerLazySingleton<BaseSearchForProductDataSource>(
        () => SearchForProductDataSource());
    sl.registerLazySingleton<BaseSearchForProductRepo>(
        () => SearchForProductRepo(baseSearchForProductDataSource: sl()));
    sl.registerLazySingleton(
        () => SearchForProductUsecase(baseSearchForProductRepo: sl()));
  }
}
