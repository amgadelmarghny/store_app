import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/checkout/data/models/payment_intent_input_model.dart';

abstract class BaseCheckoutRedo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
