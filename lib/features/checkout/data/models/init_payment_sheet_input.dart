class InitPaymentInputSheet {
  final String clientSecret;
  final String customerId;
  final String ephemeralKey;

  InitPaymentInputSheet(
      {required this.clientSecret,
      required this.customerId,
      required this.ephemeralKey});
}
