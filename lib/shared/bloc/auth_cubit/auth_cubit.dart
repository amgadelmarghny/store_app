import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:soagmb/models/login_model.dart';
import 'package:soagmb/models/profile_model.dart';
import 'package:soagmb/models/register_model.dart';
import 'package:soagmb/models/user_model.dart';
import 'package:soagmb/features/checkout/data/models/customer_payment_input_model.dart';
import 'package:soagmb/shared/network/local/key_const.dart';
import 'package:soagmb/shared/network/local/shared_helper.dart';
import 'package:soagmb/shared/network/remote/dio_helper_for_shop.dart';
import 'package:soagmb/shared/network/remote/end_points_url.dart';
import 'package:soagmb/shared/network/remote/stripe_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  IconData suffixIcon = Icons.visibility_off_outlined;
  bool obscureText = true;
//////////////////?  obscure password //////////////////

  void onEyesPressed() {
    obscureText = !obscureText;
    obscureText
        ? suffixIcon = Icons.visibility_off_outlined
        : suffixIcon = Icons.visibility_outlined;
    emit(ObsecureState());
  }
//////////////////?  form validation //////////////////

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  void validateObserver() {
    autovalidateMode = AutovalidateMode.onUserInteraction;
    emit(VAlidateState());
  }

//////////////////?  Login //////////////////
  void userLogin({required String email, required String password}) async {
    emit(LoginLodingState());
    await DioHelper.postData(
      url: login,
      data: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      emit(LoginSuccessState(loginModel: LoginModel.fromJson(value.data)));
    }).catchError((err) {
      emit(LoginFailureState(err: err.toString()));
    });
  }

//////////////? create a customer payment ///////////
  Future createACustomForPayment(
      CustomerPaymentInputModel customerPaymentInputModel) async {
    emit(CustomerPatymentLoding());
    try {
      await StripeService.createACustomer(customerPaymentInputModel)
          .then((value) {
        CashHelper.setData(key: customerID, value: value.id);
        emit(CustomerPatymentSuccess());
      });
    } catch (e) {
      emit(CustomerPatymentFailure(errMessage: e.toString()));
    }
  }

//////////////////////? registration  /////////////
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
      emit(RegisterSuccessState(
          registermodel: RegisterModel.fromJson(value.data)));
    }).catchError((err) {
      emit(RegisterFailureState(err: err.toString()));
    });
  }

  ////////////////////////////? UPDATE  USER  INFORMATION ////////////////////////
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
      emit(UpdateProfileSuccessState(profileModel: profileModel!));
    }).catchError((err) {
      emit(UpdateProfileFailureState(errMessage: err.toString()));
    });
  }
}
