import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static void initial() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<dynamic> get({
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
    required String url,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (token != null) {
      dio!.options.headers = {"Authorization": token};
    }
    return await dio!.post(
      url,
      data: data,
      queryParameters: queryParameters,
    );
  }
}
