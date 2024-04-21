import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:store_2/shared/feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:store_2/shared/feature/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:store_2/shared/network/local/api_keys.dart';
import 'package:store_2/shared/network/remot/api_service.dart';

abstract class StripeService {
  static Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    Response response = await ApiService.postData(
        url: 'https://api.stripe.com/v1/payment_intents',
        body: paymentIntentInputModel.toJson(),
        token: ApiKeys.secretKey);

    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  static Future intentPaymentSheet(
      {required PaymentIntentModel paymentIntentModel}) async {
    Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      merchantDisplayName: 'Soanbur',
      paymentIntentClientSecret: paymentIntentModel.clientSecret,
    ));
  }

  static Future displayPaymentSheet() => Stripe.instance.presentPaymentSheet();
}
