import 'package:dartz/dartz.dart';
import 'package:store_2/shared/errors/errors.dart';
import 'package:store_2/shared/feature/checkout/data/models/payment_intent_input_model.dart';

abstract class CheckoutRedo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
