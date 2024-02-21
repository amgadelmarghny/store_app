part of 'shop_cubit.dart';

@immutable
sealed class ShopStates {}

final class ShopInitial extends ShopStates {}

final class NavBarChangeState extends ShopStates {}

final class GetHomeDataLoadingState extends ShopStates {}

final class GetHomeDataSuccessState extends ShopStates {}

final class GetHomeDataFailureState extends ShopStates {
  final String errMessage;
  GetHomeDataFailureState({required this.errMessage});
}

final class GetCategoriesLoadingState extends ShopStates {}

class GetCategoriesSuccessState extends ShopStates {}

final class GetCategoriesFailureState extends ShopStates {
  final String errMessage;
  GetCategoriesFailureState({required this.errMessage});
}

final class FavoriteLoadingState extends ShopStates {}

final class FavoriteSussiccState extends ShopStates {
  final ChangedFavoriteModel changedFavoriteModel;

  FavoriteSussiccState({required this.changedFavoriteModel});
}

final class FavoriteFailureState extends ShopStates {
  final String errMessage;

  FavoriteFailureState({required this.errMessage});
}

final class GetFavoritesLoadingState extends ShopStates {}

final class GetFavoritesSuccessState extends ShopStates {}

final class GetFavoritesFailureState extends ShopStates {
  final String errMessage;
  GetFavoritesFailureState({required this.errMessage});
}

final class LogoutLoadingState extends ShopStates {}

final class LogoutSuccussState extends ShopStates {
  final LogoutModel logoutModel;

  LogoutSuccussState({required this.logoutModel});
}

final class LogoutFailureState extends ShopStates {
  final String errMessage;

  LogoutFailureState({required this.errMessage});
}
