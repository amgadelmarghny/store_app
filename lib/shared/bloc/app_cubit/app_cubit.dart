import 'package:bloc/bloc.dart';
import 'package:store_2/models/boarding_model.dart';
import 'package:store_2/shared/network/local/key_const.dart';
import 'package:store_2/shared/network/local/shared_helper.dart';

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
}
