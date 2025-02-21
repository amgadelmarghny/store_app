class Details {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  Map<String, dynamic> toJson() {
    return {
      'subtotal': subtotal,
      'shipping': shipping,
      'shipping_discount': shippingDiscount,
    };
  }
}
