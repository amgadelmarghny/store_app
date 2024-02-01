import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static void initial() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          headers: {
            "Content-Type": 'application/json',
          }),
    );
  }

  static Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) {
    return dio!.get(url, queryParameters: queryParameters);
  }

  static Future<Response> postData({
    required String url,
   required Object data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio!
        .post(
      url,
      data: data,
      queryParameters: queryParameters,
    )
        .then((value) {
      print(value.data);
      return value;
    });
  }
}
