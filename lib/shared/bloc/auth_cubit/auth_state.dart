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
  final LoginModel loginModel;

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
  final RegisterModel registermodel;
  RegisterSuccessState({required this.registermodel});
}

class RegisterFailureState extends AuthState {
  final String err;

  RegisterFailureState({required this.err});
}
//////////////// ? update profile /////////////////////

class UpdateProfileLoadingState extends AuthState {}

class UpdateProfileSuccessState extends AuthState {
  final ProfileModel profileModel;

  UpdateProfileSuccessState({required this.profileModel});
}

class UpdateProfileFailureState extends AuthState {
  final String errMessage;
  UpdateProfileFailureState({required this.errMessage});
}
