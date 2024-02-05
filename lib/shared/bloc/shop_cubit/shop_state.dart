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
  final String message;

  LogoutFailureState({required this.message});
}
