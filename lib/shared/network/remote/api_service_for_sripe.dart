import 'package:dio/dio.dart';

abstract class ApiService {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.stripe.com/v1/',
      receiveDataWhenStatusError: true,
    ),
  );

  static Future<Response> postData(
      {required String url,
      required body,
      required String token,
      Map<String, String>? headers,
      String contentType = Headers.formUrlEncodedContentType}) async {
    Response response = await dio.post(url,
        options: Options(
          contentType: contentType,
          headers: headers ?? {"Authorization": 'Bearer $token'},
        ),
        data: body);
    return response;
  }
}
