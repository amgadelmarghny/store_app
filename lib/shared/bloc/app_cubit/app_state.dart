part of 'app_cubit.dart';

sealed class AppStates {}

final class AppInitial extends AppStates {}

final class AppBrightnessChange extends AppStates {}
