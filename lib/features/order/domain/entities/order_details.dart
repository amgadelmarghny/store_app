import 'package:equatable/equatable.dart';
import 'package:soagmb/features/address/domain/entities/address.dart';
import 'package:soagmb/features/order/domain/entities/products_order.dart';

class OrderDetails extends Equatable {
  final bool? status;
  final String? message;
  final OrderDetailsData? data;

  const OrderDetails(
      {required this.status, required this.message, required this.data});

  @override
  List<Object?> get props => [status, message, data];
}

class OrderDetailsData extends Equatable {
  final int? id;
  final dynamic cost;
  final dynamic discount;
  final dynamic points;
  final dynamic vat;
  final dynamic total;
  final dynamic pointsCommission;
  final String? promoCode;
  final String? paymentMethod;
  final String? date;
  final String? status;
  final Address addressModel;
  final List<ProductsOrder>? products;

  const OrderDetailsData(
      {required this.id,
      required this.cost,
      required this.discount,
      required this.points,
      required this.vat,
      required this.total,
      required this.pointsCommission,
      required this.promoCode,
      required this.paymentMethod,
      required this.date,
      required this.status,
      required this.addressModel,
      required this.products});

  @override
  List<Object?> get props => [
        id,
        cost,
        discount,
        points,
        vat,
        total,
        pointsCommission,
        promoCode,
        paymentMethod,
        date,
        status,
        addressModel,
        products
      ];
}
