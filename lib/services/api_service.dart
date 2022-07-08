import 'dart:io';

import 'package:dio/dio.dart';
import 'package:neostore/utils/constants.dart';

class ApiService {
  final Dio _dio = Dio();
  ApiService();

  Future<Response> getRequest(
      {String subUrl = "", Map<String, dynamic> params = const {}}) async {
    String url = "$kBaseUrl$subUrl";
    Response response = await _dio.get(url, queryParameters: params);
    return response;
  }

  Future<Response> postRequest(
      {String subUrl = "",
      Map<String, dynamic> params = const {},
      Map<String, dynamic> body = const {}}) async {
    String url = "$kBaseUrl$subUrl";
    Response response =
        await _dio.post(url, queryParameters: params, data: body);
    return response;
  }
}
