import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static void initial() {
    dio = Dio(BaseOptions(baseUrl: 'https://student.valuxapps.com/api/'));
  }

  static Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) {
    return dio!.get(url, queryParameters: queryParameters);
  }

  static Future<Response> post({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    return await dio!.post(
      'User',
      queryParameters: {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
      },
    ).then((value) {
      print(value);
      return value;
    }).catchError((err) {
      print(err);
    });
  }
}
