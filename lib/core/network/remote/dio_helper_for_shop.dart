import 'package:dio/dio.dart';
import 'package:soagmb/core/network/local/key_const.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:intl/intl.dart';

abstract class DioHelper {
  static Dio? _dio;

  static void initial() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static bool _isArabic() {
    if (CashHelper.getData(key: kIsArabic) != null) {
      return CashHelper.getData(key: kIsArabic);
    } else {
      return Intl.getCurrentLocale() == 'ar';
    }
  }

  static Future<Response> getData({
    String? token,
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (token != null) {
      _dio!.options.headers = {
        "Authorization": token,
        "lang": _isArabic() ? 'ar' : 'en',
        "Content-Type": 'application/json',
      };
    }
    return await _dio!.get(
      url,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> postData({
    String? token,
    required String url,
    Object? data,
  }) async {
    if (token != null) {
      _dio!.options.headers = {
        "Authorization": token,
        "lang": _isArabic() ? 'ar' : 'en',
        "Content-Type": 'application/json',
      };
    }
    return await _dio!.post(
      url,
      data: data,
    );
  }

  static Future<Response> putData({
    String? token,
    required String url,
    Object? data,
  }) async {
    if (token != null) {
      _dio!.options.headers = {
        "Authorization": token,
        "lang": _isArabic() ? 'ar' : 'en',
        "Content-Type": 'application/json',
      };
    }
    return await _dio!.put(
      url,
      data: data,
    );
  }

  static Future<Response> deleteData({
    String? token,
    required String url,
    Object? data,
  }) async {
    if (token != null) {
      _dio!.options.headers = {
        "Authorization": token,
        "lang": _isArabic() ? 'ar' : 'en',
        "Content-Type": 'application/json',
      };
    }
    return await _dio!.delete(
      url,
      data: data,
    );
  }
}
