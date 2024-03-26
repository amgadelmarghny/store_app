part of 'shop_cubit.dart';

@immutable
sealed class ShopStates {}

class ShopInitial extends ShopStates {}

class NavBarChangeState extends ShopStates {}

///////////////////
class GetHomeDataLoadingState extends ShopStates {}

class GetHomeDataSuccessState extends ShopStates {}

class GetHomeDataFailureState extends ShopStates {
  final String errMessage;
  GetHomeDataFailureState({required this.errMessage});
}

////////////////
class GetCategoriesLoadingState extends ShopStates {}

class GetCategoriesSuccess extends ShopStates {}

class GetCategoriesFailureState extends ShopStates {
  final String errMessage;
  GetCategoriesFailureState({required this.errMessage});
}

//////////////
class FavoriteLoadingState extends ShopStates {}

class FavoriteSussiccState extends ShopStates {
  final ChangedFavoriteModel changedFavoriteModel;

  FavoriteSussiccState({required this.changedFavoriteModel});
}

class FavoriteFailureState extends ShopStates {
  final String errMessage;

  FavoriteFailureState({required this.errMessage});
}

////////////////////
class GetFavoritesLoadingState extends ShopStates {}

class GetFavoritesSuccess extends ShopStates {}

final class GetFavoritesFailureState extends ShopStates {
  final String errMessage;
  GetFavoritesFailureState({required this.errMessage});
}

//////////////////
class ShowMoreState extends ShopStates {}
/////////////////
class CartLoadingState extends ShopStates {}

class CartSussiccState extends ShopStates {
  final ChangedFavoriteModel changedCartModel;
  CartSussiccState({required this.changedCartModel});
}

class CartFailureState extends ShopStates {
  final String errMessage;

  CartFailureState({required this.errMessage});
}

////////////
class GetCartLoadingState extends ShopStates {}

class GetCartSuccessState extends ShopStates {}

class GetCartFailureState extends ShopStates {
  final String errMessage;
  GetCartFailureState({required this.errMessage});
}

//////////////////
class ProfileLoadingState extends ShopStates {}

class ProfileSuccessState extends ShopStates {}

class ProfileFailureState extends ShopStates {
  final String errMessage;
  ProfileFailureState({required this.errMessage});
}

class LogoutLoadingState extends ShopStates {}

class LogoutSuccussState extends ShopStates {
  final LogoutModel logoutModel;

  LogoutSuccussState({required this.logoutModel});
}

final class LogoutFailureState extends ShopStates {
  final String errMessage;

  LogoutFailureState({required this.errMessage});
}
