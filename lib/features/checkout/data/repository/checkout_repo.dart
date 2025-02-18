import 'package:dartz/dartz.dart';
import 'package:soagmb/core/global/errors/failure.dart';
import 'package:soagmb/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:soagmb/features/checkout/domain/repository/base_checkout_repo.dart';
import 'package:soagmb/core/network/remote/stripe_service.dart';

class CheckoutRepoImpl implements BaseCheckoutRedo {
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
