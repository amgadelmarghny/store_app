import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_2/models/user_model.dart';
import 'package:store_2/shared/network/remot/dio_helper.dart';

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

  Future register({required UserModel userModel}) async {
    emit(RegisterLodingState());
    try {
      await DioHelper.postData(
        url: 'register',
        data: {
          "name": userModel.name,
          "email": userModel.email,
          "password": userModel.password,
          "phone": userModel.phone,
        },
      );
      emit(RegisterSuccessState());
    } on Exception catch (err) {
      emit(RegisterFailureState(err: err.toString()));
    }
  }
}
