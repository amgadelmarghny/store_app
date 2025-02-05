import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/shop/domain/entities/cart/get_cart.dart';
import 'package:soagmb/features/shop/domain/entities/cart/update_cart.dart';
import 'package:soagmb/features/shop/domain/entities/categories.dart';
import 'package:soagmb/features/shop/domain/entities/change_favorite.dart';
import 'package:soagmb/features/shop/domain/entities/favorites.dart';
import 'package:soagmb/features/shop/domain/entities/home.dart';
import 'package:soagmb/features/shop/domain/entities/logout.dart';
import 'package:soagmb/features/shop/domain/entities/update_cart_items_impl.dart';
import 'package:soagmb/features/user/domain/entities/profile.dart';

abstract class BaseShopRepo {
  Future<Either<Failure, Home>> getHomeData();

  Future<Either<Failure, Categories>> getCategories();

  Future<Either<Failure, GetCart>> getCartItems();

  Future<Either<Failure, ChangedFavorite>> addAndRemoveFavorite(int id);

  Future<Either<Failure, ChangedFavorite>> addAndRemoveCart(int id);

  Future<Either<Failure, GetFavorites>> getFavoriteProducts();

  Future<Either<Failure, Profile>> getProfileInfo();

  Future<Either<Failure, UpdateCart>> updateCartItems(
      UpdateCartItemsImpl implement);

  Future<Either<Failure, Logout>> userLogout();
}
