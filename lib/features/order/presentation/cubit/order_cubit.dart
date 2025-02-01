import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/features/order/data/models/add_new_order__parameter.dart';
import 'package:soagmb/features/order/domain/entities/add_new_order.dart';
import 'package:soagmb/features/order/domain/entities/cancel_order.dart';
import 'package:soagmb/features/order/domain/entities/get_orders.dart';
import 'package:soagmb/features/order/domain/entities/order.dart';
import 'package:soagmb/features/order/domain/entities/order_details.dart';
import 'package:soagmb/features/order/domain/usecases/add_new_order_usecase.dart';
import 'package:soagmb/features/order/domain/usecases/cancel_order_usecase.dart';
import 'package:soagmb/features/order/domain/usecases/get_order_details_usecase.dart';
import 'package:soagmb/features/order/domain/usecases/get_orders_usecase.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.addNewOrderUsecase, this.getOrderDetailsUsecase,
      this.getOrdersUsecase, this.cancelOrderUsecase)
      : super(OrderInitial());

  final AddNewOrderUsecase addNewOrderUsecase;
  final GetOrderDetailsUsecase getOrderDetailsUsecase;
  final GetOrdersUsecase getOrdersUsecase;
  final CancelOrderUsecase cancelOrderUsecase;
  static OrderCubit get(context) => BlocProvider.of(context);

  ////////////////////// ! add order  ///////////////////////////
  Future<void> addNewOrder({required AddNewOrderParameter parameter}) async {
    emit(AddOrderLoading());
    final result = await addNewOrderUsecase(parameter);
    result.fold(
      (left) => emit(AddOrderFailure(error: left.errMessage)),
      (right) => emit(AddOrderSuccess(addNewOrderModel: right)),
    );
  }

  ////////////////////// ! get orders  ///////////////////////////
  List<Order> newOrdersList = [];
  List<Order> cancelledOrdersList = [];
  GetOrders? getOrdersModel;
  Future<void> getAllOrders() async {
    newOrdersList.clear();
    cancelledOrdersList.clear();
    emit(GetOrderLoading());
    final result = await getOrdersUsecase(NoParameters());
    result.fold(
      (l) => emit(GetOrderFailure(error: l.errMessage)),
      (r) {
        getOrdersModel = r;
        for (var element in r.data!.listOfOrders) {
          if (element.status == 'New' || element.status == 'جديد') {
            newOrdersList.add(element);
          } else if (element.status == 'Cancelled' ||
              element.status == 'ملغي') {
            cancelledOrdersList.add(element);
          }
        }
        emit(GetOrderSuccess(getOrdersModel: r));
      },
    );
  }

  ////////////////////! Get Order details /////////////////////
  OrderDetails? orderDetailsModel;
  void getOrderDetails({required int id}) async {
    emit(OrderDetailsLoading());
    final result = await getOrderDetailsUsecase(id);
    result.fold(
      (l) => emit(OrderDetailsFailure(error: l.errMessage)),
      (r) {
        orderDetailsModel = r;
        emit(OrderDetailsSuccess(orderDetailsModel: orderDetailsModel!));
      },
    );
  }

  ////////////////////! Cancel  the Order /////////////////////
  Future<void> cancelTheOrder({required int orderId}) async {
    emit(CancelOrderLoading());
    final result = await cancelOrderUsecase(orderId);
    result.fold(
      (l) => emit(CancelOrderFailure(error: l.errMessage)),
      (r) => emit(CancelOrderSuccess(cancelOrderModel: r)),
    );
  }
}
