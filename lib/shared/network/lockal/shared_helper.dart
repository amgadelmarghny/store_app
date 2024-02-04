import 'package:shared_preferences/shared_preferences.dart';

abstract class CashHelper {
  static SharedPreferences? sharedPreferences;
  static Future<SharedPreferences> init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({required String key}) {
    return sharedPreferences!.get(key);
  }

  static Future<bool> setData({required String key, required var value}) async {
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    } else if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    } else if (value is double) {
      return await sharedPreferences!.setDouble(key, value);
    }
    return await sharedPreferences!.setStringList(key, value);
  }

  static Future<bool> deletCash({required String key}) async {
    return await sharedPreferences!.remove(key);
  }
}
