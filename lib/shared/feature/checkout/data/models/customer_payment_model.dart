class CustomerPaymentModel {
  String? id;
  String? object;
  int? balance;
  int? created;
  dynamic currency;
  dynamic defaultSource;
  bool? delinquent;
  dynamic description;
  dynamic discount;
  String? email;
  String? invoicePrefix;
  bool? livemode;
  String? name;
  int? nextInvoiceSequence;
  String? phone;
  List<dynamic>? preferredLocales;
  dynamic shipping;
  String? taxExempt;
  dynamic testClock;

  CustomerPaymentModel({
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
    this.livemode,
    this.name,
    this.nextInvoiceSequence,
    this.phone,
    this.preferredLocales,
    this.shipping,
    this.taxExempt,
    this.testClock,
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
      livemode: json['livemode'] as bool?,
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
