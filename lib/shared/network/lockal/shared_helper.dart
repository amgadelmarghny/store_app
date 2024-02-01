import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? sharedPreferences;
  static Future<SharedPreferences> init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setBolean({required bool isDark}) async {
    return await sharedPreferences!.setBool('isDark', isDark);
  }

  static bool? getBolean() {
    return sharedPreferences!.getBool('isDark');
  }

  static Future<bool> setString(String key, String value) async {
    return await sharedPreferences!.setString(key, value);
  }

  String? getString(String key) {
   return sharedPreferences!.getString(key);
  }
}
