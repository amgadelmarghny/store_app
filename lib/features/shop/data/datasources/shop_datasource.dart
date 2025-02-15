import 'package:dio/dio.dart';
import 'package:soagmb/core/global/errors/server_exception.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/core/network/remote/dio_helper_for_shop.dart';
import 'package:soagmb/core/network/remote/end_points_url.dart';
import 'package:soagmb/features/shop/data/datasources/base_shop_datasource.dart';
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

class ShopDatasource implements BaseShopDatasource {
  @override
  Future<ChangedFavoriteModel> addAndRemoveCart(int id) async {
    final Response response = await DioHelper.postData(
      url: carts,
      token: CashHelper.getData(key: kToken),
      data: {"product_id": id},
    );
    if (response.statusCode == 200) {
      return ChangedFavoriteModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: response.data);
    }
  }

  @override
  Future<ChangedFavoriteModel> addAndRemoveFavorite(int id) async {
    final response = await DioHelper.postData(
      url: favCONST,
      token: CashHelper.getData(key: kToken),
      data: {"product_id": id},
    );
    if (response.statusCode == 200) {
      return ChangedFavoriteModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: response.data);
    }
  }

  @override
  Future<GetCartModel> getCartItems() async {
    final response = await DioHelper.getData(
      url: carts,
      token: CashHelper.getData(key: kToken),
    );
    if (response.statusCode == 200) {
      return GetCartModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: response.data);
    }
  }

  @override
  Future<CategoriesModel> getCategories() async {
    final response = await DioHelper.getData(
      url: categories,
    );
    if (response.statusCode == 200) {
      return CategoriesModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: response.data);
    }
  }

  @override
  Future<GetFavoritesModel> getFavoriteProducts() async {
    final response = await DioHelper.getData(
      url: favCONST,
      token: CashHelper.getData(key: kToken),
    );
    if (response.statusCode == 200) {
      return GetFavoritesModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: response.data);
    }
  }

  @override
  Future<HomeModel> getHomeData() async {
    final response = await DioHelper.getData(
      url: home,
      token: CashHelper.getData(key: kToken),
    );
    if (response.statusCode == 200) {
      return HomeModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: response.data);
    }
  }

  @override
  Future<ProfileModel> getProfileInfo() async {
    final response = await DioHelper.getData(
      url: profile,
      token: CashHelper.getData(key: kToken),
    );
    if (response.statusCode == 200) {
      return ProfileModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: response.data);
    }
  }

  @override
  Future<UpdateCartModel> updateCartItems(UpdateCartItemsImpl implement) async {
    final response = await DioHelper.putData(
        url: '$carts/${implement.id}',
        token: CashHelper.getData(key: kToken),
        data: {
          'quantity': implement.quantity,
        });
    if (response.statusCode == 200) {
      return UpdateCartModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: response.data);
    }
  }

  @override
  Future<LogoutModel> userLogout() async {
    final response = await DioHelper.postData(
        url: logout, token: CashHelper.getData(key: kToken));
    if (response.statusCode == 200) {
      return LogoutModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: response.data);
    }
  }

  @override
  Future<ComplaintModel> addComplaint(AddComplaintImpl implement) async {
    final response = await DioHelper.postData(
        url: 'complaints',
        token: CashHelper.getData(key: kToken),
        data: {
          'name': implement.name,
          'phone': implement.phone,
          'email': implement.email,
          'message': implement.message,
        });
    if (response.statusCode == 200) {
      return ComplaintModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: response.data);
    }
  }
}
