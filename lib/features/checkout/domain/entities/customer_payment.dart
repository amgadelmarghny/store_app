import 'package:equatable/equatable.dart';

class CustomerPayment extends Equatable {
  final String? id;
  final String? object;
  final int? balance;
  final int? created;
  final dynamic currency;
  final dynamic defaultSource;
  final bool? delinquent;
  final dynamic description;
  final dynamic discount;
  final String? email;
  final String? invoicePrefix;
  final bool? liveMode;
  final String? name;
  final int? nextInvoiceSequence;
  final String? phone;
  final List<dynamic>? preferredLocales;
  final dynamic shipping;
  final String? taxExempt;
  final dynamic testClock;

  const CustomerPayment({
    this.id,
    this.object,
    this.balance,
    this.created,
    this.currency,
    this.defaultSource,
    this.delinquent,
    this.description,
    this.discount,
    this.email,
    this.invoicePrefix,
    this.liveMode,
    this.name,
    this.nextInvoiceSequence,
    this.phone,
    this.preferredLocales,
    this.shipping,
    this.taxExempt,
    this.testClock,
  });

  @override
  List<Object?> get props => [
        id,
        object,
        balance,
        created,
        currency,
        defaultSource,
        delinquent,
        description,
        discount,
        email,
        invoicePrefix,
        liveMode,
        name,
        nextInvoiceSequence,
        phone,
        preferredLocales,
        shipping,
        taxExempt,
        testClock,
      ];
}
