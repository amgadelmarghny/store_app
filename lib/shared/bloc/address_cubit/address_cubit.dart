import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_2/models/address_models/get_address_model.dart';
import 'package:store_2/models/address_models/new_address_model.dart';
import 'package:store_2/shared/components/constants.dart';
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
  void addNewAddress({
    required String name,
    required String city,
    required String region,
    required String details,
    required String? notes,
  }) {
    emit(AddressLoading());
    DioHelper.postData(token: authToken, url: addresses, data: {
      'name': name,
      'city': city,
      'region': region,
      'details': details,
      'notes': notes,
      'latitude': '30.0616863',
      'longitude': '31.3260088',
    }).then((value) {
      newAddressModel = NewAddressModel.fromJson(value.data);
      emit(AddressSuccess(newAddressModel: newAddressModel));
    }).catchError((err) {
      emit(AddressFaluir(error: err.toString()));
    });
  }

  //////////////////////////////! GET ADDRESSES //////////////////////////
  late GetAddressesModel getAddressesModel;
  void getAddresses() {
    emit(GetAddressLoading());
    DioHelper.getData(url: addresses).then((value) {
      getAddressesModel = GetAddressesModel.fromJson(value.data);
      emit(GetAddressSuccess(getAddressesModel: getAddressesModel));
    }).catchError((err) {
      emit(GetAddressFaluir(error: err));
    });
  }
  //////////////////////////! Add Order //////////////////////////
  
}
