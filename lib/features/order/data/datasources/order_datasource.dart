import 'package:soagmb/core/global/errors/server_exception.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/core/network/remote/dio_helper_for_shop.dart';
import 'package:soagmb/core/network/remote/end_points_url.dart';
import 'package:soagmb/features/order/data/models/add_new_order__parameter.dart';
import 'package:soagmb/features/order/data/models/add_new_order_model.dart';
import 'package:soagmb/features/order/data/models/cancel_order.dart';
import 'package:soagmb/features/order/data/models/get_orders_model.dart';
import 'package:soagmb/features/order/data/models/order_details_model.dart';

abstract class BaseOrderDatasource {
  Future<AddNewOrderModel> addNewOrder(AddNewOrderParameter parameter);

  Future<GetOrdersModel> getOrders();

  Future<OrderDetailsModel> getOrderDetails(int id);

  Future<CancelOrderModel> cancelOrder(int id);
}

class OrderDatasource implements BaseOrderDatasource {
  @override
  Future<AddNewOrderModel> addNewOrder(AddNewOrderParameter parameter) async {
    final response = await DioHelper.postData(
        url: order,
        token: CashHelper.getData(key: tokenConst),
        data: {
          "address_id": parameter.addressId,
          "payment_method": parameter.paymentMethod,
          "use_points": parameter.usePoints,
        });
    if (response.statusCode == 200) {
      return AddNewOrderModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: response.data);
    }
  }

  @override
  Future<CancelOrderModel> cancelOrder(int orderId) async {
    final response = await DioHelper.getData(
        url: '$order/$orderId/cancel',
        token: CashHelper.getData(key: tokenConst));
    if (response.statusCode == 200) {
      return CancelOrderModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: response.data);
    }
  }

  @override
  Future<OrderDetailsModel> getOrderDetails(int id) async {
    final response = await DioHelper.getData(
      url: "$order/$id",
      token: CashHelper.getData(key: tokenConst),
    );
    if (response.statusCode == 200) {
      return OrderDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: response.data);
    }
  }

  @override
  Future<GetOrdersModel> getOrders() async {
    final response = await DioHelper.getData(
      url: order,
      token: CashHelper.getData(key: tokenConst),
    );
    if (response.statusCode == 200) {
      return GetOrdersModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: response.data);
    }
  }
}
