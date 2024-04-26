import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:store_2/shared/feature/checkout/data/models/customer_payment_input_model.dart';
import 'package:store_2/shared/feature/checkout/data/models/customer_payment_model.dart';
import 'package:store_2/shared/feature/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:store_2/shared/feature/checkout/data/models/init_payment_sheet_input.dart';
import 'package:store_2/shared/feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:store_2/shared/feature/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:store_2/shared/network/local/api_keys.dart';
import 'package:store_2/shared/network/remot/api_service.dart';

abstract class StripeService {
  // for payment intent
  static Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    Response response = await ApiService.postData(
        url: 'payment_intents',
        body: paymentIntentInputModel.toJson(),
        token: ApiKeys.secretKey);

    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  // for customer
  static Future<CustomerPaymentModel> createACustomer(
      CustomerPaymentInputModel customerPaymentInputModel) async {
    Response response = await ApiService.postData(
      url: 'customers',
      body: customerPaymentInputModel.toJson(),
      token: ApiKeys.secretKey,
    );
    var customerPaymentModel = CustomerPaymentModel.fromJson(response.data);
    return customerPaymentModel;
  }

  // for ephemeral key
  static Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    Response response = await ApiService.postData(
      url: 'ephemeral_keys',
      body: {"customer": customerId},
      token: ApiKeys.secretKey,
      headers: {
        "Authorization": 'Bearer ${ApiKeys.secretKey}',
        "Stripe-Version": '2023-10-16',
      },
    );
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }

  static Future intitPaymentSheet({
    required InitPaymentInputSheet initPaymentInputSheet,
  }) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      merchantDisplayName: 'Soanbur',
      customerEphemeralKeySecret: initPaymentInputSheet.ephemeralKey,
      customerId: initPaymentInputSheet.customerId,
      paymentIntentClientSecret: initPaymentInputSheet.clientSecret,
    ));
  }

// show payment sheet
  static Future displayPaymentSheet() async =>
      await Stripe.instance.presentPaymentSheet();

  static Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    PaymentIntentModel paymenyIntentModel =
        await createPaymentIntent(paymentIntentInputModel);
    EphemeralKeyModel ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    InitPaymentInputSheet initPaymentInputSheet = InitPaymentInputSheet(
        clientSecret: paymenyIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.customerId,
        ephemeralKey: ephemeralKeyModel.secret!);
    await intitPaymentSheet(initPaymentInputSheet: initPaymentInputSheet);
    await displayPaymentSheet();
  }
}
