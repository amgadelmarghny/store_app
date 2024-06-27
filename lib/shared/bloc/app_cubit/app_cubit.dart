import 'package:bloc/bloc.dart';
import 'package:Sourban/models/boarding_model.dart';
import 'package:Sourban/models/complaint_model.dart';
import 'package:Sourban/shared/network/local/key_const.dart';
import 'package:Sourban/shared/network/local/shared_helper.dart';
import '../../network/remot/dio_helper_for_shop.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());
  int pageNum = 0;

  List<BoardModel> boardList = [
    BoardModel(
      image: 'lib/assets/images/Sale3.jpg',
      shopeTitle: 'Explore many products',
      shopeSubTitle: ' Sub. title',
    ),
    BoardModel(
      image: 'lib/assets/images/Sale2.jpg',
      shopeTitle: 'Choose and Checkout',
      shopeSubTitle: 'Sub. title',
    ),
    BoardModel(
      image: 'lib/assets/images/Sale1.jpg',
      shopeTitle: 'Title',
      shopeSubTitle: 'Sub. title',
    ),
  ];
  bool isDark = true;

  void britnessChanged({bool? fromCash}) async {
    if (fromCash != null) {
      isDark = fromCash;
      emit(AppBritnessChange());
    } else {
      isDark = !isDark;
      await CashHelper.setData(key: isDarkCONST, value: isDark);
      emit(AppBritnessChange());
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
        token: CashHelper.getData(key: tOKENCONST),
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
