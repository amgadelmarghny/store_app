import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/user/data/models/change_user_password_parameter.dart';
import 'package:soagmb/features/user/data/models/login_user_parameter.dart';
import 'package:soagmb/features/user/data/models/register_user_parameter.dart';
import 'package:soagmb/features/checkout/data/models/customer_payment_input_model.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/core/network/remote/stripe_service.dart';
import 'package:soagmb/features/user/data/models/update_profile_parameter.dart';
import 'package:soagmb/features/user/domain/entities/change_password.dart';
import 'package:soagmb/features/user/domain/entities/login.dart';
import 'package:soagmb/features/user/domain/entities/profile.dart';
import 'package:soagmb/features/user/domain/entities/register.dart';
import 'package:soagmb/features/user/domain/usecases/change_user_password_usecase.dart';
import 'package:soagmb/features/user/domain/usecases/login_usecase.dart';
import 'package:soagmb/features/user/domain/usecases/register_usecase.dart';
import 'package:soagmb/features/user/domain/usecases/update_profile_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.loginUsecase, this.registerUsecase, this.updateProfileUsecase,
      this.changeUserPasswordUsecase)
      : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;
  final UpdateProfileUsecase updateProfileUsecase;
  final ChangeUserPasswordUsecase changeUserPasswordUsecase;

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
        CashHelper.setData(key: kCustomerID, value: value.id);
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
  Future<void> updateUserInfo(
      {required UpdateProfileParameter parameter}) async {
    emit(UpdateProfileLoadingState());
    final result = await updateProfileUsecase(parameter);
    result.fold(
      (l) => emit(UpdateProfileFailureState(errMessage: l.errMessage)),
      (r) => emit(UpdateProfileSuccessState(profileModel: r)),
    );
  }

  ////////////////////////? Change Password /////////////////////////////
  void changeAccPassword(
      {required ChangeUserPasswordParameter parameter}) async {
    emit(ChangePasswordLoadingState());
    final result = await changeUserPasswordUsecase(parameter);
    result.fold(
      (l) => emit(ChangePasswordFailureState(errMessage: l.errMessage)),
      (r) => emit(ChangePasswordSuccessState(changePasswordModel: r)),
    );
  }
}
