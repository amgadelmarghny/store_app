part of 'shop_cubit.dart';

@immutable
sealed class ShopStates {}

final class ShopInitial extends ShopStates {}

final class NavBarChangeState extends ShopStates {}

final class LogoutLoadingState extends ShopStates {}

final class LogoutSuccussState extends ShopStates {
  final LogoutModel logoutModel;

  LogoutSuccussState({required this.logoutModel});
}

final class LogoutFailureState extends ShopStates {
  final String errMessage;

  LogoutFailureState({required this.errMessage});
}

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
