part of 'connectivity_cubit.dart';

sealed class ConnectivityState {
  const ConnectivityState();
}

final class ConnectivityInitial extends ConnectivityState {}

final class ConnectedState extends ConnectivityState {}

final class DisConnectedState extends ConnectivityState {}
