import 'package:dartz/dartz.dart';
import 'package:Sourban/shared/errors/errors.dart';
import 'package:Sourban/shared/feature/checkout/data/models/payment_intent_input_model.dart';

abstract class CheckoutRedo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
