import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio? dio;

  static void initial() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          "Content-Type": 'application/json',
        },
      ),
    );
  }

  static Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio!
        .get(
      url,
      queryParameters: queryParameters,
    )
        .then((value) {
      debugPrint('value: ${value.data}');
      return value.data;
    }).catchError((err) {
      debugPrint('error: ${err.toString()}');
    });
  }

  static Future<Response> postData({
    String? token,
    required String url,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    dio!.options.headers = {
      "Authorization": token,
    };
    return await dio!.post(
      url,
      data: data,
      queryParameters: queryParameters,
    );
  }
}
