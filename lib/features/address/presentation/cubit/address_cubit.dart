import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/address/data/models/get_address_model.dart';
import 'package:soagmb/features/address/data/models/new_address_model.dart';
import 'package:soagmb/features/address/data/models/update_address_model.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/core/network/remote/dio_helper_for_shop.dart';
import 'package:soagmb/core/network/remote/end_points_url.dart';
import 'package:soagmb/features/address/domain/entities/address.dart';
import 'package:soagmb/features/address/domain/entities/get_addresses.dart';
import 'package:soagmb/features/address/domain/entities/new_address.dart';
import 'package:soagmb/features/address/domain/entities/update_address.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  static AddressCubit get(context) => BlocProvider.of(context);

  AddressCubit() : super(AddressInitial());

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  void validateObserver() {
    autovalidateMode = AutovalidateMode.always;
    emit(ValidateState());
  }

  ////////////////////////////////! ADD NEW ADDRESS //////////////////////
  Future addNewAddress({
    required String name,
    required String city,
    required String region,
    required String details,
    required String? notes,
  }) async {
    late NewAddress newAddressModel;

    emit(AddAddressLoading());
    return await DioHelper.postData(
        token: CashHelper.getData(key: tokenConst),
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
      emit(AddAddressSuccess(newAddressModel: newAddressModel));
    }).catchError((err) {
      emit(AddAddressFailure(error: err.toString()));
    });
  }

  void checkSetState() {
    emit(CheckSetState());
  }

  //////////////////////////////! GET ADDRESSES //////////////////////////
  Address? addressModel;
  GetAddresses? getAddressesModel;
  Future getAddresses() async {
    emit(GetAddressLoading());
    DioHelper.getData(
            url: addresses, token: CashHelper.getData(key: tokenConst))
        .then((value) {
      getAddressesModel = GetAddressesModel.fromJson(value.data);
      emit(GetAddressSuccess());
    }).catchError((err) {
      emit(GetAddressFailure(error: err));
    });
  }

  //////////////////////////! UPDATE ADDRESS /////////////////////////////

  Future updateAddress({
    required int addressId,
    required String name,
    required String city,
    required String region,
    required String details,
    required String? notes,
  }) async {
     UpdateAddress updateAddressModel;
    emit(UpdateAddressLoading());
    return await DioHelper.putData(
        url: '$addresses/$addressId',
        token: CashHelper.getData(key: tokenConst),
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
            token: CashHelper.getData(key: tokenConst))
        .then((value) async {
      deleteAddressModel = UpdateAddressModel.fromJson(value.data);
      await getAddresses();
      emit(DeleteAddressSuccess());
    }).catchError((err) {
      emit(DeleteAddressFailure(error: err.toString()));
    });
  }

  ////////////// payment method option  for order sheet ////////////
  int selectedValue = 1;
  String selectedTypeName = 'Cash';
  int isChoose = 0;
  void setSelectedValue(int value) {
    // for making selected payment method item
    // still selected even close payment sheet
    // as $selectedType
    isChoose = value;
    // increase the value to store it in selectedValue
    // to use the selectedValue in
    value++;
    if (value == 1) {
      selectedValue = value;
      selectedTypeName = 'Cash';
      print('hgggggggggg :$value');
    }
    if (value == 2) {
      selectedValue = value;
      selectedTypeName = 'Credit/Debit Card';
      print('hgggggggggg :$value');
    }
    if (value == 3) {
      selectedValue = value;
      selectedTypeName = 'PayPal';
      print('hgggggggggg :$value');
    }
    emit(CheckSetState());
  }
}
