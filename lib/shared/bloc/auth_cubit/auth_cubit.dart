import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_2/models/login_model.dart';
import 'package:store_2/models/profile_model.dart';
import 'package:store_2/models/register_model.dart';
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

  String? email, passWord;
  void userLogin() async {
    emit(LoginLodingState());

    await DioHelper.postData(
      url: login,
      data: {
        "email": email,
        "password": passWord,
      },
    ).then((value) {
      debugPrint('${value.data}');
      emit(LoginSuccessState(loginModel: LoginModel.fromJson(value.data)));
    }).catchError((err) {
      debugPrint("errorrrrrrrr : ${err.toString()}");
      emit(LoginFailureState(err: err.toString()));
    });
  }

  void userRegister({required UserModel userModel}) async {
    emit(RegisterLodingState());

    await DioHelper.postData(
      url: register,
      data: {
        "name": userModel.name,
        "email": userModel.email,
        "password": userModel.password,
        "phone": userModel.phone,
      },
    ).then((value) {
      debugPrint('${value.data}');
      emit(RegisterSuccessState(
          registermodel: Registermodel.fromJson(value.data)));
    }).catchError((err) {
      emit(RegisterFailureState(err: err.toString()));
    });
  }

  ///////////////////////////// UPDATE  USER  INFORMATION ////////////////////////
  ProfileModel? profileModel;
  Future updateUserInfo(
      {required String name,
      required String email,
      required String phoneNumber,
      required String authToken}) {
    emit(UpdateProfileLoadingState());
   return DioHelper.putData(
      url: updateProfile,
      token: authToken,
      data: {
        'name': name,
        'email': email,
        'phone': phoneNumber,
      },
    ).then((value) {
      profileModel = ProfileModel.fromJson(value.data);

      emit(UpdateProfileSuccessState(profileModel:  profileModel!));
      
    }).catchError((err) {
      emit(UpdateProfileFailureState(errMessage: err.toString()));
    });
  }
}
