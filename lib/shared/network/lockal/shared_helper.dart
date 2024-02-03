import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? sharedPreferences;
  static Future<SharedPreferences> init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({required String key}) {
    return sharedPreferences!.get(key);
  }

  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (value == String) {
      return await sharedPreferences!.setString(key, value);
    } else if (value == int) {
      return await sharedPreferences!.setInt(key, value);
    } else if (value == bool) {
      return await sharedPreferences!.setBool(key, value);
    } else if (value == double) {
      return await sharedPreferences!.setDouble(key, value);
    } else {
      return await sharedPreferences!.setStringList(key, value);
    }
  }
}
