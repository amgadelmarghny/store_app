part of 'shop_cubit.dart';

@immutable
sealed class ShopStates {}

final class ShopInitial extends ShopStates {}

final class LogoutLoading extends ShopStates {}

final class LogoutSuccuss extends ShopStates {}

final class LogoutFailure extends ShopStates {}
