import 'package:get/get.dart';

import '../../../models/response.dart';
import '../../../services/http_service.dart';
import '../../../services/http_service_impl.dart';
import 'login_provider.dart';

class LoginProviderImpl implements LoginProvider {
  late HttpService _httpService;

  //Add this to binding so that we can use it in controller or view
  LoginProviderImpl() {
    _httpService = Get.put(HttpImplementation());
    _httpService.init();
  }

  @override
  Future<ResponseModel> loginUser(Map<String, dynamic> data) async {
    final ResponseModel response =
        await _httpService.postRequest('/auth/login', data: data);
    return response;
  }

  @override
  Future<ResponseModel> checkEmail(Map<String, dynamic> data) async {
    final ResponseModel response =
        await _httpService.postRequest('/auth/checkEmail', data: data);
    return response;
  }
}
