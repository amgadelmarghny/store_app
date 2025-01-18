part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
////////////////? form obsecure /////////////////////

final class ObsecureState extends AuthState {}
////////////////? form validation /////////////////////

final class VAlidateState extends AuthState {}
////////////////? Login /////////////////////

class LoginLodingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final Login loginModel;

  LoginSuccessState({required this.loginModel});
}

class LoginFailureState extends AuthState {
  final String err;

  LoginFailureState({required this.err});
}

////////////? creaye a custpmer for payment ///////////
class CustomerPatymentLoding extends AuthState {}

class CustomerPatymentSuccess extends AuthState {}

class CustomerPatymentFailure extends AuthState {
  final String errMessage;

  CustomerPatymentFailure({required this.errMessage});
}
////////////////? Registeration /////////////////////

class RegisterLodingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final Register registermodel;
  RegisterSuccessState({required this.registermodel});
}

class RegisterFailureState extends AuthState {
  final String err;

  RegisterFailureState({required this.err});
}
//////////////// ? update profile /////////////////////

class UpdateProfileLoadingState extends AuthState {}

class UpdateProfileSuccessState extends AuthState {
  final Profile profileModel;

  UpdateProfileSuccessState({required this.profileModel});
}

class UpdateProfileFailureState extends AuthState {
  final String errMessage;
  UpdateProfileFailureState({required this.errMessage});
}

////////////////////////////////////////////////////////////////////
class ChangePasswordLoadingState extends AuthState {}

class ChangePasswordSuccessState extends AuthState {
  final ChangePassword changePasswordModel;

  ChangePasswordSuccessState({required this.changePasswordModel});
}

class ChangePasswordFailureState extends AuthState {
  final String errMessage;
  ChangePasswordFailureState({required this.errMessage});
}

