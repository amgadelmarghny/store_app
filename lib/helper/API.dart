// ignore_for_file: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class API {
  Future<dynamic> get({required String uri}) async {
    http.Response response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is problem in StatusCode , is = ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
       String? token}) async {
    //فصلتها كا ماب برا الPost request
    //عشان عايز اعمل if condition
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/x-www-form-urlencoded'
      });
    } else {
      headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw {
        'there is problem with statusCode is ${response.statusCode}'
            'with body ${jsonDecode(response.body)}'
      };
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    debugPrint('URL = $url , body = $body , token = $token');
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      debugPrint('$data');
      return data;
    } else {
      throw {
        'there is problem with statusCode: ${response.statusCode} with body ${jsonDecode(response.body)}'
      };
    }
  }
}
