import '../models/response.dart';

abstract class HttpService {
  void init();
  // Future<ResponseModel> getRequest(String url,
  //     {Map<String, dynamic> data, String? authToken});
  Future<ResponseModel> getRequest(String url,
      {Map<String, dynamic> data});
  Future<ResponseModel> postRequest(String url,
      {Map<String, dynamic>? data, String? authToken});
}
