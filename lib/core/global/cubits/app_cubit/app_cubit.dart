import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/data/models/boarding_model.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';

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
      await CashHelper.setData(key: kIsDark, value: isDark);
      emit(AppBrightnessChange());
    }
  }
}
