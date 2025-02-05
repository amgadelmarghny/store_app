import 'package:get_it/get_it.dart';
import 'package:soagmb/features/address/data/datasources/address_datasource.dart';
import 'package:soagmb/features/address/data/repositories/address_repo.dart';
import 'package:soagmb/features/address/domain/repositories/base_address_repo.dart';
import 'package:soagmb/features/address/domain/usecases/add_new_address_usecase.dart';
import 'package:soagmb/features/address/domain/usecases/delete_address_usecase.dart';
import 'package:soagmb/features/address/domain/usecases/get_addresses_usecase.dart';
import 'package:soagmb/features/address/domain/usecases/update_address_usecase.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/features/category/data/datasources/category_datasource.dart';
import 'package:soagmb/features/category/data/repositories/category_repo.dart';
import 'package:soagmb/features/category/domain/repositories/base_category_repo.dart';
import 'package:soagmb/features/category/domain/usecases/get_category_details_usecase.dart';
import 'package:soagmb/features/category/presentation/category_cubit/category_cubit.dart';
import 'package:soagmb/features/order/data/datasources/order_datasource.dart';
import 'package:soagmb/features/order/data/repositories/orders_repo.dart';
import 'package:soagmb/features/order/domain/repositories/base_orders_repo.dart';
import 'package:soagmb/features/order/domain/usecases/add_new_order_usecase.dart';
import 'package:soagmb/features/order/domain/usecases/cancel_order_usecase.dart';
import 'package:soagmb/features/order/domain/usecases/get_order_details_usecase.dart';
import 'package:soagmb/features/order/domain/usecases/get_orders_usecase.dart';
import 'package:soagmb/features/order/presentation/cubit/order_cubit.dart';
import 'package:soagmb/features/search/data/datasources/search_for_product_data_source.dart';
import 'package:soagmb/features/search/data/repositories/search_for_product_repo.dart';
import 'package:soagmb/features/search/domain/repositories/base_get_search_for_product_repo.dart';
import 'package:soagmb/features/search/domain/usecases/search_for_product_usecase.dart';
import 'package:soagmb/features/search/presentation/cubit/search_cubit.dart';
import 'package:soagmb/features/shop/data/datasources/base_shop_datasource.dart';
import 'package:soagmb/features/shop/data/datasources/shop_datasource.dart';
import 'package:soagmb/features/shop/data/repositories/shop_repo_impl.dart';
import 'package:soagmb/features/shop/domain/repositories/base_shop_repo.dart';
import 'package:soagmb/features/shop/domain/usecases/add_and_remove_cart_usecase.dart';
import 'package:soagmb/features/shop/domain/usecases/add_and_remove_favorites_usecase.dart';
import 'package:soagmb/features/shop/domain/usecases/add_complaint_usecase.dart';
import 'package:soagmb/features/shop/domain/usecases/get_cart_items_usecase.dart';
import 'package:soagmb/features/shop/domain/usecases/get_categories_usecase.dart';
import 'package:soagmb/features/shop/domain/usecases/get_favorite_products_usecase.dart';
import 'package:soagmb/features/shop/domain/usecases/get_home_data_usecase.dart';
import 'package:soagmb/features/shop/domain/usecases/get_profile_info_usecase.dart';
import 'package:soagmb/features/shop/domain/usecases/update_cart_item_usecase.dart';
import 'package:soagmb/features/shop/domain/usecases/user_logout_usecase.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';
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

    // shop
    sl.registerLazySingleton<BaseShopDatasource>(() => ShopDatasource());
    sl.registerLazySingleton<BaseShopRepo>(
        () => ShopRepoImpl(baseShopDatasource: sl()));
    sl.registerLazySingleton(() => GetHomeDataUsecase(repo: sl()));
    sl.registerLazySingleton(() => GetProfileInfoUsecase(repo: sl()));
    sl.registerLazySingleton(() => GetCartItemsUsecase(repo: sl()));
    sl.registerLazySingleton(() => GetCategoriesUsecase(repo: sl()));
    sl.registerLazySingleton(() => GetFavoriteProductsUsecase(repo: sl()));
    sl.registerLazySingleton(() => UpdateCartItemUsecase(repo: sl()));
    sl.registerLazySingleton(() => AddAndRemoveCartUsecase(repo: sl()));
    sl.registerLazySingleton(() => AddAndRemoveFavoritesUsecase(repo: sl()));
    sl.registerLazySingleton(() => UserLogoutUsecase(repo: sl()));
    sl.registerLazySingleton(() => AddComplaintUsecase(repo: sl()));
    sl.registerLazySingleton<ShopCubit>(
      () =>
          ShopCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()),
    );

    // Modify profile
    sl.registerLazySingleton<BaseUpdateProfileDatasorce>(
        () => UpdateProfileDatasorce());
    sl.registerLazySingleton<BaseUpdateProfileRepo>(
        () => UpdateProfileRepoImplement(repo: sl()));
    sl.registerLazySingleton(() => UpdateProfileUsecase(repo: sl()));
    sl.registerLazySingleton(() => ChangeUserPasswordUsecase(repo: sl()));

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

    // orders
    sl.registerLazySingleton<BaseOrderDatasource>(() => OrderDatasource());
    sl.registerLazySingleton<BaseOrdersRepo>(
        () => OrdersRepo(baseOrderDatasource: sl()));
    sl.registerLazySingleton(() => AddNewOrderUsecase(repo: sl()));
    sl.registerLazySingleton(() => GetOrdersUsecase(repo: sl()));
    sl.registerLazySingleton(() => GetOrderDetailsUsecase(repo: sl()));
    sl.registerLazySingleton(() => CancelOrderUsecase(repo: sl()));
    sl.registerLazySingleton<OrderCubit>(
        () => OrderCubit(sl(), sl(), sl(), sl()));

    // category
    sl.registerLazySingleton<BaseCategoryDatasource>(
        () => CategoryDatasource());
    sl.registerLazySingleton<BaseCategoryRepo>(
        () => CategoryRepo(baseCategoryDatasource: sl()));
    sl.registerLazySingleton(() => GetCategoryDetailsUsecase(repo: sl()));
    sl.registerLazySingleton<CategoryCubit>(() => CategoryCubit(sl()));
  }
}
