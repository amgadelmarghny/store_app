import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/core/network/remote/dio_helper_for_shop.dart';
import 'package:soagmb/core/network/remote/end_points_url.dart';
import 'package:soagmb/models/order_models/add_order_model.dart';
import 'package:soagmb/models/order_models/cancel_order.dart';
import 'package:soagmb/models/order_models/get_orders_model.dart';
import 'package:soagmb/models/order_models/order_details_model.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  static OrderCubit get(context) => BlocProvider.of(context);

  ////////////////////// ! add order  ///////////////////////////
  late AddOrderModel addOrderModel;
  Future<void> addNewOrder(
      {required int addressId,
      required int paymentMethod,
      required bool usePoints}) async {
    emit(AddOrderLoading());
    await DioHelper.postData(
        url: order,
        token: CashHelper.getData(key: tokenConst),
        data: {
          "address_id": addressId,
          "payment_method": paymentMethod,
          "use_points": usePoints,
        }).then((value) {
      addOrderModel = AddOrderModel.fromJson(value.data);
      emit(AddOrderSuccess(addOrderModel: addOrderModel));

    }).catchError((error) {
      emit(AddOrderFailure(error: error.toString()));
    });
  }

  ////////////////////// ! get orders  ///////////////////////////
  List<OrderModel> newOrdersList = [];
  List<OrderModel> cancelledOrdersList = [];
  GetOrdersModel? getOrdersModel;
  Future<void> getAllOrders() async {
    newOrdersList.clear();
    cancelledOrdersList.clear();
    emit(GetOrderLoading());
    await DioHelper.getData(
      url: order,
      token: CashHelper.getData(key: tokenConst),
    ).then((value) {
      getOrdersModel = GetOrdersModel.fromJson(value.data);
      for (var element in getOrdersModel!.data!.listOfOrders) {
        if (element.status == 'New' || element.status == 'جديد') {
          newOrdersList.add(element);
        } else if (element.status == 'Cancelled' || element.status == 'ملغي') {
          cancelledOrdersList.add(element);
        }
      }
      emit(GetOrderSuccess(getOrdersModel: getOrdersModel!));
    }).catchError((error) {
      emit(GetOrderFailure(error: error.toString()));
    });
  }

  ////////////////////! Get Order details /////////////////////
  OrderDetailsModel? orderDetailsModel;
  void getOrderDetails({required int id}) {
    emit(OrderDetailsLoading());
    DioHelper.getData(url: "$order/$id").then((value) {
      orderDetailsModel = OrderDetailsModel.fromJson(value.data);
      emit(OrderDetailsSuccess(orderDetailsModel: orderDetailsModel!));
    }).catchError((error) {
      emit(OrderDetailsFailure(error: error));
    });
  }

  ////////////////////! Cancel  the Order /////////////////////
  late CancelOrderModel cancelOrderModel;
  Future<void> cancelTheOrder({required int orderId}) async {
    emit(CancelOrderLoading());
    DioHelper.getData(
        url: '$order/$orderId/cancel',
        token: CashHelper.getData(
          key: tokenConst,
        )).then((value) async {
      cancelOrderModel = CancelOrderModel.fromJson(value.data);
      await getAllOrders();
      emit(CancelOrderSuccess(cancelOrderModel: cancelOrderModel));
    }).catchError((error) {
      emit(CancelOrderFailure(error: error));
    });
  }
}
