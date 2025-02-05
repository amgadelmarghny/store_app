import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/data/models/boarding_model.dart';
import 'package:soagmb/features/shop/data/models/complaint_model.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import '../../../core/network/remote/dio_helper_for_shop.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());
  int pageNum = 0;

  List<OnBoardModel> boardList = [
    OnBoardModel(
      image: 'lib/core/global/assets/images/Sale3.jpg',
      shopTitle: 'Explore many products',
      shopSubTitle: 'All you need in one app',
    ),
    OnBoardModel(
      image: 'lib/core/global/assets/images/Sale2.jpg',
      shopTitle: 'Choose and Checkout',
      shopSubTitle: 'Buy and order what you want from home',
    ),
    OnBoardModel(
      image: 'lib/core/global/assets/images/Sale1.jpg',
      shopTitle: 'Offers and discounts',
      shopSubTitle: 'Enjoy special discounts',
    ),
  ];
  bool isDark = true;

  Future<void> brightnessChanged({bool? fromCash}) async {
    if (fromCash != null) {
      isDark = fromCash;
      emit(AppBrightnessChange());
    } else {
      isDark = !isDark;
      await CashHelper.setData(key: isDarkCONST, value: isDark);
      emit(AppBrightnessChange());
    }
  }

  ////////////////! Add Complaint /////////////////
  ComplaintModel? complaintModel;
  void addComplaint(
      {required String name,
      required String email,
      required String phone,
      required String message}) async {
    emit(AddComplainLoading());
    await DioHelper.postData(
        url: 'complaints',
        token: CashHelper.getData(key: tokenConst),
        data: {
          'name': name,
          'phone': phone,
          'email': email,
          'message': message,
        }).then((value) {
      complaintModel = ComplaintModel.fromJson(value.data);
      emit(AddComplainSuccess());
    }).catchError((error) {
      emit(AddComplainFaluir(error: error.toString()));
    });
  }
}
