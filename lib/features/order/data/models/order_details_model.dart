import 'package:soagmb/features/address/data/models/address_model.dart';
import 'package:soagmb/features/order/data/models/products_order_model.dart';
import 'package:soagmb/features/order/domain/entities/order_details.dart';

class OrderDetailsModel extends OrderDetails {
  const OrderDetailsModel(
      {required super.status, required super.message, required super.data});

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null
            ? OrderDetailsDataModel.fromJson(json['data'])
            : null,
      );
}

class OrderDetailsDataModel extends OrderDetailsData {
  const OrderDetailsDataModel({
    required super.id,
    required super.cost,
    required super.discount,
    required super.points,
    required super.vat,
    required super.total,
    required super.pointsCommission,
    required super.promoCode,
    required super.paymentMethod,
    required super.date,
    required super.status,
    required super.addressModel,
    required super.products,
  });

  factory OrderDetailsDataModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsDataModel(
        id: json['id'],
        cost: json['cost'],
        discount: json['discount'],
        points: json['points'],
        vat: json['vat'],
        total: json['total'],
        pointsCommission: json['points_commission'],
        promoCode: json['promo_code'],
        paymentMethod: json['payment_method'],
        date: json['date'],
        status: json['status'],
        addressModel: AddressModel.fromJson(json['address']),
        products: json['products'] != null
            ? List.from(
                json['products'].map((e) => ProductsOrderModel.fromJson(e)),
              )
            : null,
      );
}
