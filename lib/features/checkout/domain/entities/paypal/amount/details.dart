class Details {
  final String subtotal;
  final String shipping;
  final int shippingDiscount;

  Details({
    required this.subtotal,
    required this.shipping,
    required this.shippingDiscount,
  });

  Map<String, dynamic> toJson() {
    return {
      'subtotal': subtotal,
      'shipping': shipping,
      'shipping_discount': shippingDiscount,
    };
  }
}
