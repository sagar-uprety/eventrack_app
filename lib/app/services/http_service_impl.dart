import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './http_service.dart';

final baseUrl = dotenv.env['SERVER_ADDRESS']! + dotenv.env['PORT']!;

class HttpImplementation implements HttpService {
  late Dio _dio;

  @override
  void init() {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
    initializeInterceptors();
  }

  @override
  Future<Response> getRequest(String url) async {
    late Response response;

    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      Response<dynamic>? result = e.response;
      //Could Not connect to server
      if (result == null) {
        print(result!.requestOptions);
        print(result.statusCode);
        print(result.statusMessage);
      }
      //Connected to Server but did not received expected response. 2xx error
      else {
        print(result.data);
        print(result.headers);
        print(result.requestOptions);
      }
    }

    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (req, handler) {
      print("${req.method} | ${req.baseUrl} | ${req.path}");
      return handler.next(req); //continue
    }, onResponse: (res, handler) {
      print("${res.statusCode} | ${res.statusMessage}");
      return handler.next(res); // continue
    }, onError: (DioError e, handler) {
      print(e.message);
      return handler.next(e); //continue
    }));
  }
}
