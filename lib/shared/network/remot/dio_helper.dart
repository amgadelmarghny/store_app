import 'package:dio/dio.dart';

abstract class DioHelper {
  static Dio? dio;

  static void initial() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<dynamic> getData({
    String? token,
    String lang = 'en',
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (token != null) {
      dio!.options.headers = {
        "Authorization": token,
        "lang": lang,
        "Content-Type": 'application/json',
      };
    }
    return await dio!.get(
      url,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> postData({
    String? token,
    String lang = 'en',
    required String url,
    Object? data,
  }) async {
    if (token != null) {
      dio!.options.headers = {
        "Authorization": token,
        "lang": lang,
        "Content-Type": 'application/json',
      };
    }
    return await dio!.post(
      url,
      data: data,
    );
  }
  static Future<Response> putData({
    String? token,
    String lang = 'en',
    required String url,
    Object? data,
  }) async {
    if (token != null) {
      dio!.options.headers = {
        "Authorization": token,
        "lang": lang,
        "Content-Type": 'application/json',
      };
    }
    return await dio!.put(
      url,
      data: data,
    );
  }
}
