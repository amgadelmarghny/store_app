import 'package:bloc/bloc.dart';
import 'package:Sourban/shared/feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:Sourban/shared/feature/checkout/data/redos/checkout_repo.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRedo) : super(PaymentInitial());

  final CheckoutRedo checkoutRedo;
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
