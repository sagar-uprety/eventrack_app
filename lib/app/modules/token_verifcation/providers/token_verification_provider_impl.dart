import 'package:get/get.dart';

import '../../../models/response.dart';
import '../../../services/http_service.dart';
import '../../../services/http_service_impl.dart';
import 'token_verification_provider.dart';

class TokenVerificationProviderImpl implements TokenVerificationProvider {
  late HttpService _httpService;

  //Add this to binding so that we can use it in controller or view
  TokenVerificationProviderImpl() {
    _httpService = Get.put(HttpImplementation());
    _httpService.init();
  }

  @override
  Future<ResponseModel?> sendToken(Map<String, dynamic> data) async {
    try {
      ResponseModel? response =
          await _httpService.getRequest('/auth/verify', data: data);
      return response;
    } on Exception catch (err) {
      print(err);
      return null;
    }
  }

  @override
  Future<ResponseModel?> verifyToken(Map<String, dynamic> data) async {
    try {
      ResponseModel? response =
          await _httpService.postRequest('/auth/verify', data: data);
      return response;
    } on Exception catch (err) {
      print(err);
      return null;
    }
  }
}
