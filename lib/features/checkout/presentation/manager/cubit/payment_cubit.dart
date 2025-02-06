import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:soagmb/features/checkout/domain/repository/base_checkout_repo.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRedo) : super(PaymentInitial());

  final BaseCheckoutRedo checkoutRedo;
  void makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    await checkoutRedo
        .makePayment(paymentIntentInputModel: paymentIntentInputModel)
        .then(
          (value) => value.fold(
            (l) => emit(PaymentFailur(errMessage: l.errMessage)),
            (r) => emit(PaymentSuccess()),
          ),
        );
  }
}
