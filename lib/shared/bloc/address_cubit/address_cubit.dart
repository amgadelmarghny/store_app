import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_2/models/address_models/address_model.dart';
import 'package:store_2/models/address_models/get_address_model.dart';
import 'package:store_2/models/address_models/new_address_model.dart';
import 'package:store_2/models/address_models/update_address_model.dart';
import 'package:store_2/models/order_models/add_order_model.dart';
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
  late GetAddressesModel getAddressesModel;
  Future getAddresses() async {
    emit(GetAddressLoading());
    DioHelper.getData(
            url: addresses, token: CashHelper.getData(key: tOKENCONST))
        .then((value) {
      getAddressesModel = GetAddressesModel.fromJson(value.data);
      emit(GetAddressSuccess(getAddressesModel: getAddressesModel));
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
  void setSelectedValue(value) {
    if (value == 1) {
      selectedValue = value;
      selectedType = 'Cash';
    }
    if (value == 2) {
      selectedValue = value;
      selectedType = 'Card';
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
          "payment_method": 1,
          "use_points": true,
        }).then((value) {
      addOrderModel = AddOrderModel.fromJson(value.data);
      emit(AddOrderSuccess(addOrderModel: addOrderModel));
    }).catchError((error) {
      emit(AddOrderFaluir(error: error.toString()));
    });
  }
}
