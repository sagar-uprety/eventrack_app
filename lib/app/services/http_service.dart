import 'package:dio/dio.dart';

abstract class HttpService {
  void init();
  Future<Response> getRequest(
      String url, Map<String, dynamic>? parameters, String? authToken);
  Future<Response> postRequest(String url, Map data, String? authToken);
}
