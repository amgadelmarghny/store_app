import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_2/models/login_model.dart';
import 'package:store_2/models/profile_model.dart';
import 'package:store_2/models/register_model.dart';
import 'package:store_2/models/user_model.dart';
import 'package:store_2/shared/feature/checkout/data/models/customer_payment_input_model.dart';
import 'package:store_2/shared/network/local/key_const.dart';
import 'package:store_2/shared/network/local/shared_helper.dart';
import 'package:store_2/shared/network/remot/dio_helper_for_shop.dart';
import 'package:store_2/shared/network/remot/end_points_url.dart';
import 'package:store_2/shared/network/remot/stripe_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  IconData suffixIcon = Icons.visibility_off_outlined;
  bool obscureText = true;
//////////////////?  obsecure password //////////////////

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

//////////////? create acustomer payment ///////////
  Future creatACustomForPayment(
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

//////////////////////? registeration  /////////////
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
          registermodel: Registermodel.fromJson(value.data)));
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
