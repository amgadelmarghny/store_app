import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_2/models/user_model.dart';
import 'package:store_2/shared/network/remot/dio_helper.dart';
import 'package:store_2/shared/network/remot/end_points_url.dart';

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

  void userLogin({required UserModel userModel}) async {
    emit(LoginLodingState());
    await DioHelper.postData(
      url: login,
      data: {
        "email": userModel.email,
        "password": userModel.password,
      },
    ).then((value) {
      print(value.data);
      emit(LoginLodingState());
    }).catchError((err) {
      emit(LoginFailureState(err: err.toString()));
    });
  }

  void userRegister({required UserModel userModel}) async {
    emit(RegisterLodingState());
    try {
      await DioHelper.postData(
        url: register,
        data: {
          "name": userModel.name,
          "email": userModel.email,
          "password": userModel.password,
          "phone": userModel.phone,
        },
      );
      emit(RegisterSuccessState());
    } on Exception catch (err) {
      print(err.toString());
      emit(RegisterFailureState(err: err.toString()));
    }
  }
}
