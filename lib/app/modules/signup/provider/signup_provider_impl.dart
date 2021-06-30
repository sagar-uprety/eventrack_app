import 'package:get/get.dart';

import '../../../models/response.dart';
import '../../../services/http_service.dart';
import '../../../services/http_service_impl.dart';
import './signup_provider.dart';

class SignUpProviderImpl implements SignUpProvider {
  late HttpService _httpService;

  //Add this to binding so that we can use it in controller or view
  SignUpProviderImpl() {
    _httpService = Get.put(HttpImplementation());
    _httpService.init();
  }

  @override
  Future<ResponseModel?> registerUser({Map<String, dynamic>? data}) async {
    try {
      //*This is where it uses our HttpService class to make dio requests and call API (backend)
      final ResponseModel response =
          await _httpService.postRequest('/auth/signup', data: data);
      return response;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
