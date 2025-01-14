import 'package:equatable/equatable.dart';
import 'automatic_payment_methods.dart';
import 'payment_method_options.dart';

class PaymentIntent extends Equatable {
  final String? object;
  final int? amount;
  final int? amountCapturable;
  final int? amountReceived;
  final dynamic application;
  final dynamic applicationFeeAmount;
  final AutomaticPaymentMethods? automaticPaymentMethods;
  final dynamic canceledAt;
  final dynamic cancellationReason;
  final String? captureMethod;
  final String? clientSecret;
  final String? confirmationMethod;
  final int? created;
  final String? currency;
  final dynamic customer;
  final dynamic description;
  final dynamic invoice;
  final dynamic lastPaymentError;
  final dynamic latestCharge;
  final bool? livemode;
  final dynamic nextAction;
  final dynamic onBehalfOf;
  final dynamic paymentMethod;
  final PaymentMethodOptions? paymentMethodOptions;
  final List<dynamic>? paymentMethodTypes;
  final dynamic processing;
  final dynamic receiptEmail;
  final dynamic review;
  final dynamic setupFutureUsage;
  final dynamic shipping;
  final dynamic source;
  final dynamic statementDescriptor;
  final dynamic statementDescriptorSuffix;
  final String? status;
  final dynamic transferData;
  final dynamic transferGroup;

  const PaymentIntent(
      {required this.object,
      required this.amount,
      required this.amountCapturable,
      required this.amountReceived,
      required this.application,
      required this.applicationFeeAmount,
      required this.automaticPaymentMethods,
      required this.canceledAt,
      required this.cancellationReason,
      required this.captureMethod,
      required this.clientSecret,
      required this.confirmationMethod,
      required this.created,
      required this.currency,
      required this.customer,
      required this.description,
      required this.invoice,
      required this.lastPaymentError,
      required this.latestCharge,
      required this.livemode,
      required this.nextAction,
      required this.onBehalfOf,
      required this.paymentMethod,
      required this.paymentMethodOptions,
      required this.paymentMethodTypes,
      required this.processing,
      required this.receiptEmail,
      required this.review,
      required this.setupFutureUsage,
      required this.shipping,
      required this.source,
      required this.statementDescriptor,
      required this.statementDescriptorSuffix,
      required this.status,
      required this.transferData,
      required this.transferGroup});

  @override
  List<Object?> get props => [
        object,
        amount,
        amountCapturable,
        amountReceived,
        application,
        applicationFeeAmount,
        automaticPaymentMethods,
        canceledAt,
        cancellationReason,
        captureMethod,
        clientSecret,
        confirmationMethod,
        created,
        currency,
        customer,
        description,
        invoice,
        lastPaymentError,
        latestCharge,
        livemode,
        nextAction,
        onBehalfOf,
        paymentMethod,
        paymentMethodOptions,
        paymentMethodTypes,
        processing,
        receiptEmail,
        review,
        setupFutureUsage,
        shipping,
        source,
        statementDescriptor,
        statementDescriptorSuffix,
        status,
        transferData,
        transferGroup
      ];
}
