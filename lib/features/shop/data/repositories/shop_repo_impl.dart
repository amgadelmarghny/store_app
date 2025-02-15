import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/core/global/errors/server_exception.dart';
import 'package:soagmb/features/shop/data/datasources/base_shop_datasource.dart';
import 'package:soagmb/features/shop/domain/entities/add_complaint_impl.dart';
import 'package:soagmb/features/shop/domain/entities/cart/get_cart.dart';
import 'package:soagmb/features/shop/domain/entities/cart/update_cart.dart';
import 'package:soagmb/features/shop/domain/entities/categories.dart';
import 'package:soagmb/features/shop/domain/entities/change_favorite.dart';
import 'package:soagmb/features/shop/domain/entities/complaint.dart';
import 'package:soagmb/features/shop/domain/entities/favorites.dart';
import 'package:soagmb/features/shop/domain/entities/home.dart';
import 'package:soagmb/features/shop/domain/entities/logout.dart';
import 'package:soagmb/features/shop/domain/entities/update_cart_items_impl.dart';
import 'package:soagmb/features/shop/domain/repositories/base_shop_repo.dart';
import 'package:soagmb/features/shop/domain/entities/user/profile.dart';

class ShopRepoImpl implements BaseShopRepo {
  final BaseShopDatasource baseShopDatasource;

  ShopRepoImpl({required this.baseShopDatasource});

  @override
  Future<Either<Failure, ChangedFavorite>> addAndRemoveCart(int id) async {
    final result = await baseShopDatasource.addAndRemoveCart(id);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, ChangedFavorite>> addAndRemoveFavorite(int id) async {
    final result = await baseShopDatasource.addAndRemoveFavorite(id);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, GetCart>> getCartItems() async {
    final result = await baseShopDatasource.getCartItems();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, Categories>> getCategories() async {
    final result = await baseShopDatasource.getCategories();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, GetFavorites>> getFavoriteProducts() async {
    final result = await baseShopDatasource.getFavoriteProducts();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, Home>> getHomeData() async {
    final result = await baseShopDatasource.getHomeData();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, Profile>> getProfileInfo() async {
    final result = await baseShopDatasource.getProfileInfo();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, UpdateCart>> updateCartItems(
      UpdateCartItemsImpl implement) async {
    final result = await baseShopDatasource.updateCartItems(implement);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, Logout>> userLogout() async {
    final result = await baseShopDatasource.userLogout();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, Complaint>> addComplaint(
      AddComplaintImpl parameter) async {
    final result = await baseShopDatasource.addComplaint(parameter);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errMessage: e.errorModel.message));
    }
  }
}
