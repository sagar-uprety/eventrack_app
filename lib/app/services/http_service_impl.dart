import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './http_service.dart';

//TODO: Add PUT, PATCH, DELETE Requests

final baseUrl = dotenv.env['SERVER_ADDRESS']! + dotenv.env['PORT']!;

class HttpImplementation implements HttpService {
  late Dio _dio;

  @override
  void init() {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
    initializeInterceptors();
  }

  //GET Request
  @override
  Future<Response> getRequest(
      String url, Map<String, dynamic>? parameters, String? authToken) async {
    late Response response;
    Options options = Options(headers: {'auth-token': authToken});

    response =
        await _dio.get(url, queryParameters: parameters, options: options);

    return response;
  }

  //POST REQUEST
  @override
  Future<Response> postRequest(String url, Map data, String? authToken) async {
    late Response response;
    Options options = Options(headers: {'auth-token': authToken});
    response = await _dio.post(url, data: data, options: options);

    return response;
  }

  //These intercepts intercepts all of our requests, responses and error
  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (req, handler) {
          print("${req.method} | ${req.baseUrl} | ${req.path}");
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
          print(e.message);
          return handler.next(e); //continue
        },
      ),
    );
  }
}
