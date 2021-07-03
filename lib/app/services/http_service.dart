import '../models/response.dart';

abstract class HttpService {
  void init();
  Future<ResponseModel> getRequest(String url,
      {Map<String, dynamic> data, String? authToken});
  Future<ResponseModel> postRequest(String url, {data, String? authToken});
}
