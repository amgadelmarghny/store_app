import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/user/data/models/change_password.dart';
import 'package:soagmb/features/user/data/models/login_user_parameter.dart';
import 'package:soagmb/features/user/data/models/profile_model.dart';
import 'package:soagmb/features/user/data/models/register_user_parameter.dart';
import 'package:soagmb/features/checkout/data/models/customer_payment_input_model.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/core/network/remote/dio_helper_for_shop.dart';
import 'package:soagmb/core/network/remote/end_points_url.dart';
import 'package:soagmb/core/network/remote/stripe_service.dart';
import 'package:soagmb/features/user/domain/entities/login.dart';
import 'package:soagmb/features/user/domain/entities/register.dart';
import 'package:soagmb/features/user/domain/usecases/login_usecase.dart';
import 'package:soagmb/features/user/domain/usecases/register_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.loginUsecase, this.registerUsecase) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;
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
  void userLogin({required LoginUserParameter loginParameter}) async {
    emit(LoginLodingState());
    final result = await loginUsecase(loginParameter);
    result.fold(
      (l) => emit(LoginFailureState(err: l.errMessage)),
      (r) => emit(LoginSuccessState(loginModel: r)),
    );
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
  void userRegister({required RegisterUserParameter parameter}) async {
    emit(RegisterLodingState());
    final result = await registerUsecase(parameter);
    result.fold(
      (l) => emit(RegisterFailureState(err: l.errMessage)),
      (r) => emit(RegisterSuccessState(registermodel: r)),
    );
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

   ////////////////////////? Change Password /////////////////////////////
  void changeAccPassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoadingState());
    await DioHelper.postData(
      url: changePassword,
      token: CashHelper.getData(key: tOKENCONST),
      data: {
        'current_password': currentPassword,
        'new_password': newPassword,
      },
    ).then((value) {
     
      emit(ChangePasswordSuccessState(
          changePasswordModel: ChangePasswordModel.fromJson(value.data)));
    }).catchError((error) {
      emit(ChangePasswordFailureState(errMessage: error.toString()));
    });
  }
}
