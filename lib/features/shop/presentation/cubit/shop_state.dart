part of 'shop_cubit.dart';

@immutable
sealed class ShopStates {
  const ShopStates();
}

class ShopInitial extends ShopStates {}

class NatigateBottomBar extends ShopStates {}

///////////////////
class GetHomeDataLoadingState extends ShopStates {}

class GetHomeDataSuccessState extends ShopStates {}

class GetHomeDataFailureState extends ShopStates {
  final String errMessage;
  const GetHomeDataFailureState({required this.errMessage});
}

////////////////
class GetCategoriesLoadingState extends ShopStates {}

class GetCategoriesSuccess extends ShopStates {}

class GetCategoriesFailureState extends ShopStates {
  final String errMessage;
  const GetCategoriesFailureState({required this.errMessage});
}

//////////////
class FavoriteLoadingState extends ShopStates {}

class FavoriteSussiccState extends ShopStates {
  final ChangedFavorite changedFavoriteModel;

  const FavoriteSussiccState({required this.changedFavoriteModel});
}

class FavoriteFailureState extends ShopStates {
  final String errMessage;

  const FavoriteFailureState({required this.errMessage});
}

////////////////////
class GetFavoritesLoadingState extends ShopStates {}

class GetFavoritesSuccess extends ShopStates {}

final class GetFavoritesFailureState extends ShopStates {
  final String errMessage;
  const GetFavoritesFailureState({required this.errMessage});
}

/////////////////
class AddToCartLoadingState extends ShopStates {}

class AddToCartSussiccState extends ShopStates {
  final ChangedFavorite changedCartModel;
  const AddToCartSussiccState({required this.changedCartModel});
}

class AddToCartFailureState extends ShopStates {
  final String errMessage;

  const AddToCartFailureState({required this.errMessage});
}

///////////////////////////////////////////////////////////
class GetCartLoadingState extends ShopStates {}

class GetCartSuccessState extends ShopStates {}

class GetCartFailureState extends ShopStates {
  final String errMessage;
  const GetCartFailureState({required this.errMessage});
}

////////////////
class UpdateCartLoadingState extends ShopStates {}

class UpdateCartSuccessState extends ShopStates {}

class UpdateCartFailureState extends ShopStates {
  final String errMessage;
  const UpdateCartFailureState({required this.errMessage});
}

////////////////////////////////////////////////////////////////////
class ProfileLoadingState extends ShopStates {}

class ProfileSuccessState extends ShopStates {}

class ProfileFailureState extends ShopStates {
  final String errMessage;
  const ProfileFailureState({required this.errMessage});
}

///////////////////////////////////////////////////////////////////

//////////////// ? update profile /////////////////////

class UpdateProfileLoadingState extends ShopStates {}

class UpdateProfileSuccessState extends ShopStates {
  final Profile profileModel;

  const UpdateProfileSuccessState({required this.profileModel});
}

class UpdateProfileFailureState extends ShopStates {
  final String errMessage;
  const UpdateProfileFailureState({required this.errMessage});
}

////////// Pic Image ///
final class PickImageSuccessState extends ShopStates {
  const PickImageSuccessState();
}

final class PickImageFailureState extends ShopStates {
  final String errMessage;

  const PickImageFailureState({required this.errMessage});
}

////////////////////////////////////////////////////////////////////
class ChangePasswordLoadingState extends ShopStates {}

class ChangePasswordSuccessState extends ShopStates {
  final ChangePassword changePasswordModel;

  const ChangePasswordSuccessState({required this.changePasswordModel});
}

class ChangePasswordFailureState extends ShopStates {
  final String errMessage;
  const ChangePasswordFailureState({required this.errMessage});
}

class LogoutLoadingState extends ShopStates {}

class LogoutSuccussState extends ShopStates {
  final Logout logoutModel;

  const LogoutSuccussState({required this.logoutModel});
}

final class LogoutFailureState extends ShopStates {
  final String errMessage;

  const LogoutFailureState({required this.errMessage});
}

////////////// Complation ////////////////

final class AddComplainLoading extends ShopStates {}

final class AddComplainSuccess extends ShopStates {}

final class AddComplainFaluir extends ShopStates {
  final String error;
  const AddComplainFaluir({required this.error});
}
