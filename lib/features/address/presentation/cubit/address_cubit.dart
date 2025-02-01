import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/global/base_usecases/base_usecase.dart';
import 'package:soagmb/features/address/data/models/add_new_address_parameter.dart';
import 'package:soagmb/features/address/data/models/update_address_parameter.dart';
import 'package:soagmb/features/address/domain/entities/address.dart';
import 'package:soagmb/features/address/domain/entities/get_addresses.dart';
import 'package:soagmb/features/address/domain/entities/new_address.dart';
import 'package:soagmb/features/address/domain/entities/update_address.dart';
import 'package:soagmb/features/address/domain/usecases/add_new_address_usecase.dart';
import 'package:soagmb/features/address/domain/usecases/delete_address_usecase.dart';
import 'package:soagmb/features/address/domain/usecases/get_addresses_usecase.dart';
import 'package:soagmb/features/address/domain/usecases/update_address_usecase.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit(this.getAddressesUsecase, this.addNewAddressUsecase,
      this.updateAddressUsecase, this.deleteAddressUsecase)
      : super(AddressInitial());
  static AddressCubit get(context) => BlocProvider.of(context);
  final GetAddressesUsecase getAddressesUsecase;
  final AddNewAddressUsecase addNewAddressUsecase;
  final UpdateAddressUsecase updateAddressUsecase;
  final DeleteAddressUsecase deleteAddressUsecase;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  void validateObserver() {
    autovalidateMode = AutovalidateMode.always;
    emit(ValidateState());
  }

  ////////////////////////////////! ADD NEW ADDRESS //////////////////////
  Future addNewAddress({required AddNewAddressParameter parameter}) async {
    emit(AddAddressLoading());
    final result = await addNewAddressUsecase(parameter);
    return result.fold((l) => emit(AddAddressFailure(error: l.errMessage)),
        (right) {
      getAddresses();
      emit(AddAddressSuccess(newAddressModel: right));
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
    final result = await getAddressesUsecase(NoParameters());
    return result.fold((l) => emit(GetAddressFailure(error: l.errMessage)),
        (right) {
      getAddressesModel = right;
      emit(GetAddressSuccess());
    });
  }

  //////////////////////////! UPDATE ADDRESS /////////////////////////////

  Future updateAddress({required UpdateAddressParameter parameter}) async {
    emit(UpdateAddressLoading());
    final result = await updateAddressUsecase(parameter);
    return result.fold((l) => emit(UpdateAddressFailure(error: l.errMessage)),
        (right) {
      getAddresses();
      emit(UpdateAddressSuccess(updateAddressModel: right));
    });
  }

  //////////////////////////! DELETE ADDRESS /////////////////////////////
  Future deleteAddress({required int addressId}) async {
    emit(DeleteAddressLoading());
    final result = await deleteAddressUsecase(addressId);
    return result.fold((l) => emit(DeleteAddressFailure(error: l.errMessage)),
        (right) async => await getAddresses());
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
    }
    if (value == 2) {
      selectedValue = value;
      selectedTypeName = 'Credit/Debit Card';
    }
    if (value == 3) {
      selectedValue = value;
      selectedTypeName = 'PayPal';
    }
    emit(CheckSetState());
  }
}
