part of 'app_cubit.dart';

sealed class AppStates {}

final class AppInitial extends AppStates {}

final class AppBrightnessChange extends AppStates {}

//////////////////////
final class AddComplainLoading extends AppStates {}

final class AddComplainSuccess extends AppStates {}

final class AddComplainFaluir extends AppStates {
  final String error;
  AddComplainFaluir({required this.error});
}
