part of 'shop_cubit.dart';

@immutable
sealed class ShopStates {}

final class ShopInitial extends ShopStates {}

final class LogoutLoading extends ShopStates {}

final class LogoutSuccuss extends ShopStates {
  final LogoutModel  logoutModel;

  LogoutSuccuss({required this.logoutModel});
}

final class LogoutFailure extends ShopStates {
  final  String message;

  LogoutFailure({required this.message});

}
