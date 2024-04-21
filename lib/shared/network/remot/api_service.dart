import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio();

  Future<Response> postData(
      {required String url,
      required body,
      required String token,
      String contentType = Headers.formUrlEncodedContentType}) async {
    Response response = await dio.post(url,
        options: Options(contentType: contentType, headers: {
          "Authorization": "Bearer $token",
        },),
      
        data: body);
    return response;
  }
}
