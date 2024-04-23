import 'package:dartz/dartz.dart';
import 'package:store_2/shared/errors/errors.dart';
import 'package:store_2/shared/feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:store_2/shared/feature/checkout/data/redos/checkout_repo.dart';
import 'package:store_2/shared/network/remot/stripe_service.dart';

class CheckoutRepoImpl implements CheckoutRedo {
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await StripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
