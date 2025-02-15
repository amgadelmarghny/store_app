part of 'auth_cubit.dart';

sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}
////////////////? form obsecure /////////////////////

final class ObsecureState extends AuthState {}
////////////////? form validation /////////////////////

final class VAlidateState extends AuthState {}
////////////////? Login /////////////////////

class LoginLodingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final Login loginModel;

  const LoginSuccessState({required this.loginModel});
}

class LoginFailureState extends AuthState {
  final String err;

  const LoginFailureState({required this.err});
}

////////////? creaye a custpmer for payment ///////////
class CustomerPatymentLoding extends AuthState {}

class CustomerPatymentSuccess extends AuthState {}

class CustomerPatymentFailure extends AuthState {
  final String errMessage;

  const CustomerPatymentFailure({required this.errMessage});
}
////////////////? Registeration /////////////////////

class RegisterLodingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final Register registermodel;
  const RegisterSuccessState({required this.registermodel});
}

class RegisterFailureState extends AuthState {
  final String err;

  const RegisterFailureState({required this.err});
}

