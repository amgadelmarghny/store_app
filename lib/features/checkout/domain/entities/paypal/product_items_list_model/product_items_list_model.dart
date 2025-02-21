import 'item.dart';

class ProductItemsListModel {
  List<Item>? items;

  ProductItemsListModel({this.items});

  factory ProductItemsListModel.fromItemsNameAppleQuantity4Price10CurrencyUsdNamePineappleQuantity5Price12CurrencyUsd(
      Map<String, dynamic> json) {
    return ProductItemsListModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item
              .fromItemsNameAppleQuantity4Price10CurrencyUsdNamePineappleQuantity5Price12CurrencyUsd(
                  e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic>
      toItemsNameAppleQuantity4Price10CurrencyUsdNamePineappleQuantity5Price12CurrencyUsd() {
    return {
      'items': items
          ?.map((e) => e
              .toItemsNameAppleQuantity4Price10CurrencyUsdNamePineappleQuantity5Price12CurrencyUsd())
          .toList(),
    };
  }
}
