import 'package:get_it/get_it.dart';
import 'package:soagmb/features/address/data/datasources/address_datasource.dart';
import 'package:soagmb/features/address/data/repositories/address_repo.dart';
import 'package:soagmb/features/address/domain/repositories/base_address_repo.dart';
import 'package:soagmb/features/address/domain/usecases/add_new_address_usecase.dart';
import 'package:soagmb/features/address/domain/usecases/delete_address_usecase.dart';
import 'package:soagmb/features/address/domain/usecases/get_addresses_usecase.dart';
import 'package:soagmb/features/address/domain/usecases/update_address_usecase.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/features/search/data/datasources/search_for_product_data_source.dart';
import 'package:soagmb/features/search/data/repositories/search_for_product_repo.dart';
import 'package:soagmb/features/search/domain/repositories/base_get_search_for_product_repo.dart';
import 'package:soagmb/features/search/domain/usecases/search_for_product_usecase.dart';
import 'package:soagmb/features/search/presentation/cubit/search_cubit.dart';
import 'package:soagmb/features/user/data/datasources/auth_datasource.dart';
import 'package:soagmb/features/user/data/datasources/update_profile_datasorce.dart';
import 'package:soagmb/features/user/data/repositories/auth_repo_implement.dart';
import 'package:soagmb/features/user/data/repositories/update_profile_repo_implement.dart';
import 'package:soagmb/features/user/domain/repositories/base_auth_repo.dart';
import 'package:soagmb/features/user/domain/repositories/base_update_profile_repo.dart';
import 'package:soagmb/features/user/domain/usecases/change_user_password_usecase.dart';
import 'package:soagmb/features/user/domain/usecases/login_usecase.dart';
import 'package:soagmb/features/user/domain/usecases/register_usecase.dart';
import 'package:soagmb/features/user/domain/usecases/update_profile_usecase.dart';
import 'package:soagmb/features/user/presentation/cubit/auth_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static init() {
    // Auth
    sl.registerLazySingleton<BaseAuthDatasource>(() => AuthDatasource());
    sl.registerLazySingleton<BaseAuthRepo>(
        () => AuthRepoImplement(baseAuthDatasource: sl()));
    sl.registerLazySingleton(() => RegisterUsecase(repository: sl()));
    sl.registerLazySingleton(() => LoginUsecase(repository: sl()));
    sl.registerLazySingleton<AuthCubit>(
        () => AuthCubit(sl(), sl(), sl(), sl()));

    // Modify profile
    sl.registerLazySingleton<BaseUpdateProfileDatasorce>(
        () => UpdateProfileDatasorce());
    sl.registerLazySingleton<BaseUpdateProfileRepo>(
        () => UpdateProfileRepoImplement(repo: sl()));
    sl.registerLazySingleton(() => UpdateProfileUsecase(baseRepo: sl()));
    sl.registerLazySingleton(() => ChangeUserPasswordUsecase(baseRepo: sl()));

    // Search
    sl.registerLazySingleton<BaseSearchForProductDataSource>(
        () => SearchForProductDataSource());
    sl.registerLazySingleton<BaseSearchForProductRepo>(
        () => SearchForProductRepo(baseSearchForProductDataSource: sl()));
    sl.registerLazySingleton(
        () => SearchForProductUsecase(baseSearchForProductRepo: sl()));
    sl.registerLazySingleton<SearchCubit>(() => SearchCubit(sl()));

    // address
    sl.registerLazySingleton<BaseAddressDatasource>(() => AddressDatasource());
    sl.registerLazySingleton<BaseAddressRepo>(
        () => AddressRepo(baseAddressDatasource: sl()));
    sl.registerLazySingleton(() => AddNewAddressUsecase(repo: sl()));
    sl.registerLazySingleton(() => UpdateAddressUsecase(repo: sl()));
    sl.registerLazySingleton(() => GetAddressesUsecase(repo: sl()));
    sl.registerLazySingleton(() => DeleteAddressUsecase(repo: sl()));
    sl.registerLazySingleton<AddressCubit>(
        () => AddressCubit(sl(), sl(), sl(), sl()));
  }
}
