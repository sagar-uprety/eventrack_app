import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'http_service.dart';

//TODO: Add PUT, PATCH, DELETE Requests
//TODO: Handle Errors Very Very Nicely. Still Exception are not catched properly.
//! Try making request without auth-token and see logs and Dart Network Inspector
final baseUrl = dotenv.env['SERVER_ADDRESS']! + dotenv.env['PORT']!;

class HttpImplementation implements HttpService {
  late Dio _dio;

  @override
  void init() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
    ));
    initializeInterceptors();
  }

  //GET Request
  @override
  Future<Response?> getRequest(String url,
      {Map<String, dynamic>? parameters, String? authToken}) async {
    late Response response;

    if (parameters != null && authToken != null) {
      Options options = Options(headers: {'auth-token': authToken});
      response = await _dio.get(
        url,
        queryParameters: parameters,
        options: options,
      );
    } else {
      response = await _dio.get(url);
    }

    return response;
  }

  //POST REQUEST
  @override
  Future<Response> postRequest(String url,
      {Map<String, dynamic>? data, String? authToken}) async {
    late Response response;
    if (authToken != null && data != null) {
      Options options = Options(headers: {'auth-token': authToken});
      response = await _dio.post(url, data: data, options: options);
    } else {
      response = await _dio.post(url);
    }

    return response;
  }

  //These intercepts intercepts all of our requests, responses and error
  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (req, handler) {
          print(
              "${req.method} | ${req.baseUrl} | ${req.path} | ${req.data}| ${req.headers}");
          return handler.next(req); //continue
        },
        onResponse: (res, handler) {
          print("${res.statusCode} | ${res.statusMessage}");
          return handler.next(res); // continue
        },
        // Error Handling
        onError: (DioError e, handler) {
          Response<dynamic>? result = e.response;
          //Could Not connect to server

          //Connected to Server but did not received expected response. 2xx error
          if (result != null) {
            print(result.data);
            print(result.headers);
            print(result.statusCode);
            print(result.statusMessage);
          }
          //Could Not connect to server
          else {
            print(e.message);
          }

          return handler.next(e); //continue
        },
      ),
    );
  }
}
