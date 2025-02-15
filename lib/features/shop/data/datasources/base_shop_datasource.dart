import 'package:soagmb/features/shop/data/models/cahnge_favorite_model.dart';
import 'package:soagmb/features/shop/data/models/cart_models/get_cart_model.dart';
import 'package:soagmb/features/shop/data/models/cart_models/update_cart_model.dart';
import 'package:soagmb/features/shop/data/models/categories_model.dart';
import 'package:soagmb/features/shop/data/models/complaint_model.dart';
import 'package:soagmb/features/shop/data/models/favorites_model.dart';
import 'package:soagmb/features/shop/data/models/home_model.dart';
import 'package:soagmb/features/shop/data/models/user/logout_model.dart';
import 'package:soagmb/features/shop/domain/entities/add_complaint_impl.dart';
import 'package:soagmb/features/shop/domain/entities/update_cart_items_impl.dart';
import 'package:soagmb/features/shop/data/models/user/profile_model.dart';

abstract class BaseShopDatasource {
  Future<HomeModel> getHomeData();

  Future<CategoriesModel> getCategories();

  Future<GetCartModel> getCartItems();

  Future<ChangedFavoriteModel> addAndRemoveFavorite(int id);

  Future<ChangedFavoriteModel> addAndRemoveCart(int id);

  Future<GetFavoritesModel> getFavoriteProducts();

  Future<ProfileModel> getProfileInfo();

  Future<UpdateCartModel> updateCartItems(UpdateCartItemsImpl implement);

  Future<LogoutModel> userLogout();

  Future<ComplaintModel> addComplaint(AddComplaintImpl implement);
}
