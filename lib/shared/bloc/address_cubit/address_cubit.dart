import 'package:bloc/bloc.dart';
import 'package:store_2/shared/components/constants.dart';
import 'package:store_2/shared/network/remot/dio_helper.dart';
import 'package:store_2/shared/network/remot/end_points_url.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());

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
      emit(AddressSuccess());
    }).catchError((err) {
      emit(AddressFaluir(error: err.toString()));
    });
  }
}
