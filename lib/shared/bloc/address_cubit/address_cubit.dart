import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:Sourban/models/address_models/address_model.dart';
import 'package:Sourban/models/address_models/get_address_model.dart';
import 'package:Sourban/models/address_models/new_address_model.dart';
import 'package:Sourban/models/address_models/update_address_model.dart';
import 'package:Sourban/models/order_models/add_order_model.dart';
import 'package:Sourban/models/order_models/cancel_order.dart';
import 'package:Sourban/models/order_models/get_orders_model.dart';
import 'package:Sourban/models/order_models/order_details_model.dart';
import 'package:Sourban/shared/network/local/key_const.dart';
import 'package:Sourban/shared/network/local/shared_helper.dart';
import 'package:Sourban/shared/network/remote/dio_helper_for_shop.dart';
import 'package:Sourban/shared/network/remote/end_points_url.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  void validateObserver() {
    autovalidateMode = AutovalidateMode.always;
    emit(VAlidateState());
  }

  ////////////////////////////////! ADD NEW ADDRESS //////////////////////
  late NewAddressModel newAddressModel;
  Future addNewAddress({
    required String name,
    required String city,
    required String region,
    required String details,
    required String? notes,
  }) async {
    emit(AddressLoading());
    return await DioHelper.postData(
        token: CashHelper.getData(key: tOKENCONST),
        url: addresses,
        data: {
          'name': name,
          'city': city,
          'region': region,
          'details': details,
          'notes': notes,
          'latitude': '30.0616863',
          'longitude': '31.3260088',
        }).then((value) {
      newAddressModel = NewAddressModel.fromJson(value.data);
      getAddresses();
      emit(AddressSuccess(newAddressModel: newAddressModel));
    }).catchError((err) {
      emit(AddressFaluir(error: err.toString()));
    });
  }

  bool? isChecked;
  void checkSetState() {
    emit(CheckSetState());
  }

  //////////////////////////////! GET ADDRESSES //////////////////////////
  AddressModel? addressModel;
  GetAddressesModel? getAddressesModel;
  Future getAddresses() async {
    emit(GetAddressLoading());
    DioHelper.getData(
            url: addresses, token: CashHelper.getData(key: tOKENCONST))
        .then((value) {
      getAddressesModel = GetAddressesModel.fromJson(value.data);
      emit(GetAddressSuccess(getAddressesModel: getAddressesModel!));
    }).catchError((err) {
      emit(GetAddressFaluir(error: err));
    });
  }

  //////////////////////////! UPDATE ADDRESS /////////////////////////////
  late UpdateAddressModel updateAddressModel;

  Future updateAddress({
    required int addressId,
    required String name,
    required String city,
    required String region,
    required String details,
    required String? notes,
  }) async {
    emit(UpdateAddressLoading());
    return await DioHelper.putData(
        url: '$addresses/$addressId',
        token: CashHelper.getData(key: tOKENCONST),
        data: {
          'name': name,
          'city': city,
          'region': region,
          'details': details,
          'notes': notes,
          'latitude': '30.0616863',
          'longitude': '31.3260088',
        }).then((value) {
      updateAddressModel = UpdateAddressModel.fromJson(value.data);
      getAddresses();
      emit(UpdateAddressSuccess(updateAddressModel: updateAddressModel));
    });
  }

  //////////////////////////! DELETE ADDRESS /////////////////////////////
  late UpdateAddressModel deleteAddressModel;
  Future deleteAddress({required int addressId}) async {
    emit(DeleteAddressLoading());
    return await DioHelper.deleteData(
            url: "$addresses/$addressId",
            token: CashHelper.getData(key: tOKENCONST))
        .then((value) async {
      deleteAddressModel = UpdateAddressModel.fromJson(value.data);
      await getAddresses();
      emit(DeleteAddressSuccess());
    }).catchError((err) {
      emit(DeleteAddressFaluir(error: err.toString()));
    });
  }

  ////////////// payment method option  for order sheet ////////////
  int selectedValue = 1;
  String selectedType = 'Cash';
  int isChoose = 0;
  void setSelectedValue(value) {
    // for making selected payment method item
    // still selected even close payment sheet
    // as $selectedType
    isChoose = value;
    // increase the value to store it in selectedValue
    // to use the selectedValue in
    value++;
    if (value == 1) {
      selectedValue = value;
      selectedType = 'Cash';
    }
    if (value == 2) {
      selectedValue = value;
      selectedType = 'Credit/Debit Card';
    }
    if (value == 3) {
      selectedValue = value;
      selectedType = 'PayPal';
    }
    emit(CheckSetState());
  }

  ////////////////////// ! add order  ///////////////////////////
  late AddOrderModel addOrderModel;
  Future addNewOrder(
      {required int addressId,
      required int paymentMethod,
      required bool usePoints}) async {
    emit(AddOrderLoading());
    await DioHelper.postData(
        url: order,
        token: CashHelper.getData(key: tOKENCONST),
        data: {
          "address_id": addressId,
          "payment_method": paymentMethod,
          "use_points": usePoints,
        }).then((value) {
      addOrderModel = AddOrderModel.fromJson(value.data);
      getAllOrders();
      emit(AddOrderSuccess(addOrderModel: addOrderModel));
    }).catchError((error) {
      emit(AddOrderFaluir(error: error.toString()));
    });
  }

  ////////////////////// ! get orders  ///////////////////////////
  List<OrderModel> newOrdersList = [];
  List<OrderModel> cancelledOrdersList = [];
  GetOrdersModel? getOrdersModel;
  void getAllOrders() async {
    newOrdersList.clear();
    cancelledOrdersList.clear();
    emit(GetOrderLoading());
    await DioHelper.getData(
      url: order,
      token: CashHelper.getData(key: tOKENCONST),
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
      emit(GetOrderFaluir(error: error.toString()));
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
      emit(OrderDetailsFaluir(error: error));
    });
  }

  ////////////////////! Cancel  the Order /////////////////////
  late CancelOrderModel cancelOrderModel;
  Future<void> cancelTheOrder({required int orderId}) async {
    emit(CancleOrderLoading());
    DioHelper.getData(
        url: '$order/$orderId/cancel',
        token: CashHelper.getData(
          key: tOKENCONST,
        )).then((value) {
      cancelOrderModel = CancelOrderModel.fromJson(value.data);
      getAllOrders();
      emit(CancleOrderSuccess(cancleOrderModel: cancelOrderModel));
    }).catchError((error) {
      emit(CancleOrderFaluir(error: error));
    });
  }
}
