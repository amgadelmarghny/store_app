import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  IconData suffixIcon = Icons.visibility_off_outlined;
  bool obscureText = true;

  void onEyesPressed() {
    obscureText = !obscureText;
    obscureText
        ? suffixIcon = Icons.visibility_off_outlined
        : suffixIcon = Icons.visibility_outlined;
    emit(ObsecureState());
  }

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void validateObserver() {
    autovalidateMode = AutovalidateMode.onUserInteraction;
    emit(VAlidateState());
  }
}
