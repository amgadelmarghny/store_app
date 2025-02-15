import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/auth/data/models/login_user_parameter.dart';
import 'package:soagmb/features/auth/data/models/register_user_parameter.dart';
import 'package:soagmb/features/checkout/data/models/customer_payment_input_model.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/core/network/remote/stripe_service.dart';
import 'package:soagmb/features/auth/domain/entities/login.dart';
import 'package:soagmb/features/auth/domain/entities/register.dart';
import 'package:soagmb/features/auth/domain/usecases/login_usecase.dart';
import 'package:soagmb/features/auth/domain/usecases/register_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.loginUsecase, this.registerUsecase, 
     )
      : super(AuthInitial());

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
}
