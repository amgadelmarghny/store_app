import 'package:soagmb/features/checkout/domain/entities/customer_payment.dart';

class CustomerPaymentModel extends CustomerPayment {
  const CustomerPaymentModel({
    required super.id,
    required super.object,
    required super.balance,
    required super.created,
    required super.currency,
    required super.defaultSource,
    required super.delinquent,
    required super.description,
    required super.discount,
    required super.email,
    required super.invoicePrefix,
    required super.liveMode,
    required super.name,
    required super.nextInvoiceSequence,
    required super.phone,
    required super.preferredLocales,
    required super.shipping,
    required super.taxExempt,
    required super.testClock,
  });
  factory CustomerPaymentModel.fromJson(Map<String, dynamic> json) {
    return CustomerPaymentModel(
      id: json['id'] as String?,
      object: json['object'] as String?,
      balance: json['balance'] as int?,
      created: json['created'] as int?,
      currency: json['currency'] as dynamic,
      defaultSource: json['default_source'] as dynamic,
      delinquent: json['delinquent'] as bool?,
      description: json['description'] as dynamic,
      discount: json['discount'] as dynamic,
      email: json['email'],
      invoicePrefix: json['invoice_prefix'] as String?,
      liveMode: json['livemode'] as bool?,
      name: json['name'] as String?,
      nextInvoiceSequence: json['next_invoice_sequence'] as int?,
      phone: json['phone'],
      preferredLocales: json['preferred_locales'] as List<dynamic>?,
      shipping: json['shipping'] as dynamic,
      taxExempt: json['tax_exempt'] as String?,
      testClock: json['test_clock'] as dynamic,
    );
  }
}
