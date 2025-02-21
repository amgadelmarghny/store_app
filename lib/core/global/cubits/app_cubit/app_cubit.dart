import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/shop/data/models/boarding_model.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/generated/l10n.dart';
import 'package:intl/intl.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());
  int pageNum = 0;
  static AppCubit get(context) => BlocProvider.of(context);

  List<OnBoardModel> boardList(context) => [
        OnBoardModel(
          image: 'lib/core/global/assets/images/Sale3.jpg',
          shopTitle: S.of(context).explore_many_products,
          shopSubTitle: S.of(context).all_you_need_in_one_app,
        ),
        OnBoardModel(
          image: 'lib/core/global/assets/images/Sale2.jpg',
          shopTitle: S.of(context).choose_and_checkout,
          shopSubTitle: S.of(context).buy_and_order_what_you_want_from_home,
        ),
        OnBoardModel(
          image: 'lib/core/global/assets/images/Sale1.jpg',
          shopTitle: S.of(context).offers_and_discounts,
          shopSubTitle: S.of(context).enjoy_special_discounts,
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

  bool? isArabicLang;
  Future<void> languageToggle({bool? fromCash}) async {
    if (fromCash != null) {
      isArabicLang = fromCash;
      emit(LangouageToggleState());
    } else {
      isArabicLang = Intl.getCurrentLocale() == 'ar' ? true : false;
      isArabicLang = !isArabicLang!;
      await CashHelper.setData(key: kIsArabic, value: isArabicLang);
      emit(LangouageToggleState());
    }
  }
}
