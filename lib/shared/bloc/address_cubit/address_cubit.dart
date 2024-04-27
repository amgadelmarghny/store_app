import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_2/models/address_models/address_model.dart';
import 'package:store_2/models/address_models/get_address_model.dart';
import 'package:store_2/models/address_models/new_address_model.dart';
import 'package:store_2/models/address_models/update_address_model.dart';
import 'package:store_2/models/order_models/add_order_model.dart';
import 'package:store_2/models/order_models/cancle_order.dart';
import 'package:store_2/models/order_models/get_orders_model.dart';
import 'package:store_2/models/order_models/order_details_model.dart';
import 'package:store_2/shared/network/local/key_const.dart';
import 'package:store_2/shared/network/local/shared_helper.dart';
import 'package:store_2/shared/network/remot/dio_helper.dart';
import 'package:store_2/shared/network/remot/end_points_url.dart';

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
    value++;
    if (value == 1) {
      selectedValue = value;
      selectedType = 'Cash';
    }
    if (value == 2) {
      selectedValue = value;
      selectedType = 'Credit/Debit Card';
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

  ////////////////////! Cancle  the Order /////////////////////
  late CancelOrderModel cancleOrderModel;
  Future<void> cancelTheOrder({required int orderId}) async {
    emit(CancleOrderLoading());
    DioHelper.getData(
        url: '$order/$orderId/cancel',
        token: CashHelper.getData(
          key: tOKENCONST,
        )).then((value) {
      cancleOrderModel = CancelOrderModel.fromJson(value.data);
      getAllOrders();
      emit(CancleOrderSuccess(cancleOrderModel: cancleOrderModel));
    }).catchError((error) {
      emit(CancleOrderFaluir(error: error));
    });
  }
}
