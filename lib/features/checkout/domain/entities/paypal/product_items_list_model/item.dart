class Item {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Item({this.name, this.quantity, this.price, this.currency});

  factory Item.fromItemsNameAppleQuantity4Price10CurrencyUsdNamePineappleQuantity5Price12CurrencyUsd(
      Map<String, dynamic> json) {
    return Item(
      name: json['name'] as String?,
      quantity: json['quantity'] as int?,
      price: json['price'] as String?,
      currency: json['currency'] as String?,
    );
  }

  Map<String, dynamic>
      toItemsNameAppleQuantity4Price10CurrencyUsdNamePineappleQuantity5Price12CurrencyUsd() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'currency': currency,
    };
  }
}
